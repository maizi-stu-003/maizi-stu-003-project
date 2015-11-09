# -*- coding: utf-8 -*-
import logging
from django.shortcuts import render, redirect, HttpResponse
from django.core.urlresolvers import reverse
from django.conf import settings
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.hashers import make_password
from django.core.paginator import Paginator,InvalidPage, EmptyPage, PageNotAnInteger
from django.db import connection
from django.db.models import Count
from models import *
#from forms import *
import json
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
#email
from email import encoders
from email.header import Header
from email.mime.text import MIMEText
from email.utils import parseaddr, formataddr
import smtplib
import base64


from PIL import Image, ImageDraw, ImageFont
from django.http.response import HttpResponse
from maiziedu.settings import BASE_DIR
import cStringIO, string, os, random

logger = logging.getLogger('maiziapp.views')

def global_setting(request):

    SITE_NAME = settings.SITE_NAME
    SITE_DESC = settings.SITE_DESC
    MEDIA_URL = settings.MEDIA_URL
    SITE_URL = settings.SITE_URL

def captcha1(request):
    '''Captcha1'''
    image = Image.new('RGB', (147, 49), color = (255, 255, 255)) # model, size, background color
    font_file = os.path.join(settings.BASE_DIR, 'static/fonts/Arial.ttf') # choose a font file
    font = ImageFont.truetype(font_file, 47) # the font object
    draw = ImageDraw.Draw(image)
    rand_str = ''.join(random.sample(string.letters + string.digits, 4)) # The random string
    draw.text((7, 0), rand_str, fill=(0, 0, 0), font=font) # position, content, color, font
    del draw
    #request.session['captcha'] = rand_str.lower() # store the content in Django's session store
    request.session['captcha'] = rand_str         # store the content in Django's session store
    buf = cStringIO.StringIO() # a memory buffer used to store the generated image
    image.save(buf, 'jpeg')
    return HttpResponse(buf.getvalue(), 'image/jpeg') # return the image data stream as image/jpeg format, browser will treat it as an image



#index
def index(request):
    return render(request, 'base.html', locals())


# 注销
def do_logout(request):
    try:
        logout(request)
    except Exception as e:
        print e
        logger.error(e)
    #return index(request)
    return render(request, 'base.html', locals())
    #return redirect(request.META['HTTP_REFERER'])
#def do_logout(request):
#    del req.session['username']  #删除session
#    del req.session['email']  #删除session
#    #return HttpResponse('logout ok!')
#    return render(request, 'login.html', locals())



# 注册
def do_reg(request):
    try:
        if request.method == 'POST':
            if request.POST['email']:
                # 注册
                

                email = request.POST['email']
                password = make_password(request.POST['emailpass'])
                username = email.split('@')[0]
                print email
                print type(email)
                #checkemail
                sqlstr = email
                #emaillist = UserProfile.objects.filter(Q(email__contains=str(sqlstr)))
                emaillist = UserProfile.objects.filter(email=sqlstr)
                #print "emaillist"
                #print emaillist
                # null reg  ,not null error
                if  not emaillist:

                    #newadd
                    
                    inputcaptcha = request.POST['inputcaptcha']
                    sessioncaptcha = request.session.get('captcha')
                    #print inputcaptcha
                    #print type(inputcaptcha)
                    #print sessioncaptcha
                    #print type(sessioncaptcha)

                    if inputcaptcha == sessioncaptcha:
                        user = UserProfile.objects.create(email=email,password=password,username=username)
                        user.save()

                        # 登录
                        user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                        login(request, user)
                        request.session['email'] = email
                        request.session['username'] = username

                    else:
                        return render(request, 'register.html', {'reason': '验证码不正确'})
                    return render(request, 'base.html', locals())

                else:

                    return render(request, 'register.html', {'reason': '用户名已经被注册'})
            else:
                return render(request, 'register.html', {'reason': '邮箱或密码不正确'})

        else:
            return render(request, 'register.html', locals())
    except Exception as e:
        logger.error(e)
    return render(request, 'register.html', locals())

# 登录
@csrf_exempt
def do_login(request):
    try:

        if request.method == 'POST':
            email = request.POST.get('email', None)
            password = request.POST.get('password', None)
            user = authenticate(email=email, password=password)
            print user
            if user:
                user.backend = 'maiziapp.auth.CustomBackend' # 指定自定义的登录验证方式
                login(request, user)
                request.session['email'] = user.email
                snemail = request.session['email']

                return render(request, 'base.html', locals())
            else:
                return render(request,'login.html', {'reason': '登录账号或密码错误'})

    except Exception as e:
        logger.error(e)
    return render(request, 'login.html', locals())
    #return HttpResponse(u'登录成功!欢迎您' , content_type='text/html')


#sendmail

def _format_addr(s):
    name, addr = parseaddr(s)
    return formataddr(( \
        Header(name, 'utf-8').encode(), \
        addr.encode('utf-8') if isinstance(addr, unicode) else addr))

def do_sendmail(FromAddr,Password,To_Addr,Smtp_Server,Msg_Type='html',Msg_Url='None',Attachment='None'):


    from_addr = FromAddr
    password = Password
    to_addr = To_Addr
    smtp_server = Smtp_Server
    msg_type = Msg_Type
    msg_url = Msg_Url
    attachment = Attachment
    username = to_addr.split('@')[0]

    #plain
    #msg = MIMEText('hello, send by Python...', 'plain', 'utf-8')
    msg = MIMEText('<html><body><h1>Hello</h1>' +
        '<p>send by <a href="' + msg_url  +'">重置密码链接</a>...</p>' +
        '</body></html>', msg_type, 'utf-8')
    msg['From'] = _format_addr(u'麦子学院 <%s>' % from_addr)
    msg['To'] = _format_addr(u'麦子学院用户 <%s>' % to_addr)
    msg['Subject'] = Header(u'重置用户密码', 'utf-8').encode()

    server = smtplib.SMTP(smtp_server, 25)
    server.set_debuglevel(1)
    server.login(from_addr, password)
    server.sendmail(from_addr, [to_addr], msg.as_string())
    server.quit()

#def do_sendmail(FromAddr,Password,To_Addr,Smtp_Server,Msg_Type='html',Msg_Url='None',Attachment='None'):
#do_sendmail('willy.yu@2li.cc','123456','35959819@qq.com','smtp.ym.163.com','html','http://www.python.org','')


def go_verifyemail(request):
    return render(request, 'verifyemail.html')


#verifyemail
@csrf_exempt
def do_verifyemail(request):

    try:

        if request.method == 'GET':

            email = request.GET.get('email', None)
            #email = email.decode('utf-8') #utf-8


            try:
                # 获邮箱信息
                emailinfo = UserProfile.objects.get(email=email)
                useremail = str(emailinfo.email)  #uft-8转为str
                if  email == useremail:
                    b64useremail = base64.b64encode(email)
                    FromAddr = 'willy.yu@2li.cc'
                    Password = '123456'
                    To_Addr =  useremail
                    Smtp_Server = 'smtp.ym.163.com'
                    Msg_Type = 'html'
                    Msg_Url = 'http://192.168.1.5:8000/resetpassword?b64useremail=' + b64useremail
                    Attachment = ''
                    do_sendmail(FromAddr,Password,To_Addr,Smtp_Server,Msg_Type,Msg_Url,'')
                    #do_sendmail('willy.yu@2li.cc','123456','willy.yu@2li.cc','smtp.ym.163.com','html',Msg_Url,'')
  ######
                    #return HttpResponse(u'登录成功!欢迎您，%s' % useremail, content_type='text/html')   
                    return HttpResponse(u'已经发送重置密码的邮件,请登录 %s  查收邮件' % emailinfo.email, content_type='text/html')
                else:
                    #return HttpResponse(u'登录失败', content_type='text/html')                  
                    return render(request, 'verifyemail.html', {'reason': '输入的注册邮箱不存在'})
            except UserProfile.DoesNotExist as e:
                logger.error(e)
                return render(request, 'verifyemail.html', {'reason': '输入的注册邮箱不存在'})

    except Exception as e:
        logger.error(e)
    return render(request, 'verifyemail.html', locals())


def go_resetpassword_html(request):


    try:
        #get
        if request.method == 'GET':
            b64useremail = request.GET.get('b64useremail', None)
            email = base64.b64decode(b64useremail)
            #把获取表单的email传递给session对象
            request.session['email'] = email
            return render(request, 'resetpassword.html', locals())

    except Exception as e:
        logger.error(e)
    #return HttpResponseRedirect('/updatepassword/')
    return render(request, 'resetpassword.html', {'reason': '访问邮箱页面出错'})


@csrf_exempt
#resetpassword
def do_updatepassword(request):


    try:
        #get
        if request.method == 'POST':
            password = make_password(request.POST.get('newpassword', None))
            email = request.session.get('email','None')




            emailinfo = UserProfile.objects.get(email=email)
            useremail = str(emailinfo.email)  #uft-8转为str
            if  email == useremail:
                UserProfile.objects.filter(email=email).update(password=password)
                return HttpResponse(u'%s 邮箱的密码更新成功' % email, content_type='text/html')
            else:
                return HttpResponse(u'邮箱密码更新失败', content_type='text/html')
    except Exception as e:
        logger.error(e)
    #return render(request, 'resetpassword.html', locals())
    return render(request, 'resetpassword.html', {'reason': '邮箱密码更新失败'})




