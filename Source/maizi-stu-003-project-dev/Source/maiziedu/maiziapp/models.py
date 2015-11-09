# -*- coding:utf-8 -*-
from django.db import models
from django.contrib.auth.models import  AbstractBaseUser, PermissionsMixin, BaseUserManager
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _

from django.core import validators
from django.core.mail import send_mail

#AuthUserManager
class UserProfileManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, password, is_superuser, is_staff, **extra_fields):
        """
        Creates and saves a User with the given username, email and password.
        """
        now = timezone.now()
        if not email:
            raise ValueError(u'Email不能为空')
        email = self.normalize_email(email)
#change1
        user = self.model(email=email,
                          password=password,
                          is_active=True,
                          is_superuser=is_superuser,
                          is_staff=is_staff, 
                          date_joined=now,**extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email=None, password=None, **extra_fields):
        return self._create_user(email, password, False, False,
                                 **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        return self._create_user(email, password, True, True,
                                 **extra_fields)

# AbstractBaseUser
class AuthUserProfile(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(u'email address', blank=True, unique=True,
#change3
#     email = models.CharField(_('username'), max_length=30, unique=True,
                             help_text=_('Required. 30 characters or fewer.check email format.'),
                             #validators=[validators.RegexValidator(r'^[\w.@+-]+$',_('Enter a valid email. '), 'invalid'),],
                             ##validators=[validators.RegexValidator(r'^([\w+\.]*)[\w+]@([\w+\.]*)[\w+]$',_('Enter a valid email. '), 'invalid'),],
                             validators=[validators.RegexValidator(r'^([\w+\.]*)[\w+]@([\w+\.\w+]+)$',_('Enter a valid email. '), 'invalid'),],
                             error_messages={'unique': _("Email  already exists."),
                             })

    username = models.CharField(max_length=30, unique=True, blank=True)
    is_staff = models.BooleanField(u'staff status', default=False,)
    is_active = models.BooleanField(u'active', default=True,)
    date_joined = models.DateTimeField(_('date joined'), default=timezone.now)
    #qq = models.CharField(max_length=20, null=True, blank=True, verbose_name=u'qq')
    #phone = models.CharField(max_length=15, null=True, blank=True, verbose_name=u'phone')

    objects = UserProfileManager()

    USERNAME_FIELD = 'email'

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')
#change2
        abstract = True

    def get_full_name(self):
        """
        Returns the first_name plus the last_name, with a space in between.
        """
        full_name = '%s' % self.username
        return full_name.strip()

    def get_short_name(self):
        "Returns the short name for the user."
        return self.username

    def email_user(self, subject, message, from_email=None, **kwargs):
        """
        Sends an email to this User.
        """
        send_mail(subject, message, from_email, [self.email], **kwargs)

# 国家
class CountryDict(models.Model):
    name = models.CharField(u'国家', max_length=50)

    class Meta:
        verbose_name = u'国家'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


# 省份
class ProvinceDict(models.Model):
    name = models.CharField(u'省份', max_length=50)
    country = models.ForeignKey('CountryDict', verbose_name=u'所属国家')

    class Meta:
        verbose_name = u'省份'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


# 城市
class CityDict(models.Model):
    name = models.CharField(u'城市', max_length=50)
    province = models.ForeignKey('ProvinceDict', verbose_name=u'所属省份')

    class Meta:
        verbose_name = u'城市'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

# UserProfile
class UserProfile(AuthUserProfile):
    avatar_url = models.ImageField(u'头像地址', upload_to='avatar/%Y/%m', default='avatar/default.png',
                                   max_length=200, blank=True)
    avatar_thumbnail_url = models.ImageField(u'头像缩略图地址', upload_to='avatar_thumbnail/%Y/%m',
                                             default='avatar_thumbnail/default.png', max_length=200, blank=True)
    qqnumber = models.CharField('QQ', max_length=20, blank=True)
    #mobile = models.CharField(u'手机号', max_length=11, blank=True, unique=True)
    mobile = models.CharField(max_length=11, blank=True, null=True, verbose_name=u'手机号',
                             validators=[validators.RegexValidator(r'^\d{11}', _('Enter a valid phone number.'),
                                                                   'invalid'), ]) 
    company_name = models.CharField(u'公司名称', max_length=150, blank=True)
    position = models.CharField(u'地址', max_length=150, blank=True)
    country = models.ForeignKey('CountryDict', null=True, blank=True, verbose_name='国家')
    city = models.ForeignKey('CityDict', null=True, blank=True, verbose_name=u'城市')
    province = models.ForeignKey('ProvinceDict', null=True, blank=True, verbose_name=u'省份')


    class Meta:
        verbose_name = u'用户信息'
        verbose_name_plural = verbose_name
        ordering = ['-id']

    def __unicode__(self):
        return self.email


# 学生
#class Student(models.Model):
#    user = models.OneToOneField('UserProfile', verbose_name=u'用户信息')
#    certificate = models.ForeignKey('Certificate', verbose_name=u'证书')
#    badge = models.ForeignKey('BadgeDict', verbose_name=u'徽章')
#    student_class = models.ForeignKey('Class', verbose_name=u'学生班级')

#    class Meta:
#        verbose_name = u'学生'
#        verbose_name_plural = verbose_name

#    def __unicode__(self):
#        return self.user.username


# 教师
#class Teacher(models.Model):
#    user = models.OneToOneField('UserProfile', verbose_name=u'用户')
#    position = models.CharField(max_length=50, verbose_name=u'职位')
#    description = models.CharField(max_length=200, verbose_name=u'描述')

#    class Meta:
#        verbose_name = u'教师'
#        verbose_name_plural = verbose_name

#    def __unicode__(self):
#        return self.user.username
