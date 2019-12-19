from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
# from .models import User
from django.template import loader
from django.http import Http404
from django.urls import reverse
from django.views import generic
import requests
from rest_framework.decorators import api_view
from rest_framework.decorators import parser_classes
from rest_framework.parsers import JSONParser
from rest_framework.response import Response
from django.http import JsonResponse
from django.core import serializers
import json

from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives

# from models import User
from . import models

from django.db import connection

from . import migrates


def index(request):
    return render(request, "index.html", {"users": 1})

# *********************************************
# begin common


# convert cursor to json data
def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]


# execute query sql with cursor
def executeQuery(sql):
    with connection.cursor() as cursor:
        cursor.execute(sql)
        data = dictfetchall(cursor)
    return data
# end common
# ********************************************* 


# *********************************************
# begin export
@api_view(['POST'])
@parser_classes((JSONParser,))
# get all data from User
def export_function_have_sql(request, format=None):
    data = json.loads(json.dumps(request.data))  
    print(data['data_source'])
    data_output = migrates.export_function_have_sql(data['data_source'])

    return Response(data_output) 
# end export 
# *********************************************


# *********************************************
# begin export
@api_view(['POST'])
@parser_classes((JSONParser,))
# get all data from User
def export_comment_vba(request, format=None):
    data = json.loads(json.dumps(request.data))  
    print(data['data_source'])
    data_output = migrates.export_comment_vba(data['data_source'])

    return Response(data_output) 
# end export 
# *********************************************


# *********************************************
# begin migrate
@api_view(['POST'])
@parser_classes((JSONParser,))
# get all data from User
def migrate(request, format=None):
    data = json.loads(json.dumps(request.data))    

    data_output = migrates.main_migrate(data['data_source'], data['data_pattern'])

    return Response(data_output) 
# end migrate 
# *********************************************
