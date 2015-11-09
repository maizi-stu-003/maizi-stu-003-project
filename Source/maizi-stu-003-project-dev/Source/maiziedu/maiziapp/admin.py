# -*- coding:utf-8 -*-
from django.contrib import admin
from models import *

# Register your models here.
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('email', 'username','is_staff','is_active','is_superuser','avatar_url','avatar_thumbnail_url','qqnumber','mobile','company_name','position','country','city','province',)
admin.site.register(UserProfile,UserProfileAdmin)


class CountryDictAdmin(admin.ModelAdmin):
    list_display = ('name',)
admin.site.register(CountryDict,CountryDictAdmin)


class ProvinceDictAdmin(admin.ModelAdmin):
    list_display = ('name','country',)
admin.site.register(ProvinceDict,ProvinceDictAdmin)

class CityDictAdmin(admin.ModelAdmin):
    list_display = ('name','province',)
admin.site.register(CityDict,CityDictAdmin)
