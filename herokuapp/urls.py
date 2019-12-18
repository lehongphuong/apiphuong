from django.urls import path, include
from . import views

app_name = 'home'
urlpatterns = [
    path('', views.index, name='index'),  
    # *******************************************************
    # begin User
    path('export_function_have_sql', views.export_function_have_sql, name='export_function_have_sql'),
    path('migrate', views.migrate, name='migrate'),
    # end User
    # ******************************************************* 
]
