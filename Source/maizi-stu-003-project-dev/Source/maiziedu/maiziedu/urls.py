"""maiziedu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from maiziapp.views import *

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
#    url(r'^logout$',maiziapp.views.do_logout,name='logout'),
    url(r'^$', index, name='index'),
    url(r'^reg/$',do_reg,name='reg'),
    url(r'^login/$',do_login,name='login'),
    url(r'^logout/$',do_logout,name='logout'),
    url(r'^goverifyemail/$',go_verifyemail,name='goverifyemail'),
    url(r'^doverifyemail/$',do_verifyemail,name='doverifyemail'),
    #url(r'^resetpassword(?P<b64useremail>\[/w/W]+)$',go_resetpassword_html,name='goresetpasswordhtml'),
    url(r'^resetpassword$',go_resetpassword_html,name='goresetpasswordhtml'),
    url(r'^updatepassword/$',do_updatepassword,name='updatepassword'),
#    url(r'^captcha/', include('captcha.urls')),
    url(r'^captcha1/$', captcha1,name='captcha1'),
]
