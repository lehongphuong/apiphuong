from django.contrib import admin

# Register your models here.
from . import models 

class CompanyAdmin(admin.ModelAdmin):
    list_display = ('id', 'id_parent', 'username',
                    'password', 'name', 'born', 'address')
    list_filter = ('id', 'id_parent', 'username',
                   'password', 'name', 'born', 'address')
    search_fields = ('id', 'id_parent', 'username',
                     'password', 'name', 'born', 'address')  

admin.site.register(models.Company, CompanyAdmin) 
