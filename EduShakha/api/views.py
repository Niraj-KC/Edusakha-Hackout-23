from django.shortcuts import render
import json
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
import pickle
import numpy as np
import os
from django.conf import settings
from sklearn.preprocessing import StandardScaler
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAdminUser
import datetime
from users.models import User, Meeting, JWT

DATE_FORMAT = '%d/%m/%Y %H:%M'

# Create your views here.
@csrf_exempt
def model(request):
    if request.method == "POST":
        print("SUCCESSFULL ! ")
        model = pickle.load(open(os.path.join(settings.BASE_DIR,"api\\ML_MODELS\\model.pkl"), 'rb'))
        # print(str(request.body))
        data=json.loads(str((request).body, encoding='utf-8').replace('\'', '\"'))
        data = {"AT" : 14.96, "V" : 41.78, "AP": 1024.07, "RH": 73.17}
        print("HERE")
        scaler = StandardScaler()
        scaler.mean_ = np.array([19.66662399,   54.42372485, 1013.23717664,   73.29876535])
        scaler.var_ = np.array([55.31178803, 162.16916014,  35.31472679, 213.10017839])
        scaler.scale_ = np.array([7.5110347 , 12.58627985,  5.9210543 , 14.60564948])
        X = np.array([[data["AT"], data["V"], data["AP"], data["RH"]]])
        X = scaler.transform(X)
        y = model.predict(X)
        response_data = {"result" : str(y[0])}
        return JsonResponse({"responseData" : (response_data)})
    else:
        print("BACK")

@csrf_exempt
def schedule_meeting(request):
    if request.method == "POST":
        body = json.loads(str((request).body, encoding='utf-8').replace('\'', '\"'))
        try :
            jwt_token = request.headers['Authorization']
            jwt = JWT.objects.get(token = jwt_token)
            user = User.objects.get(jwt = jwt)
            host_name = body["host_name"]
            date_time = body["date_time"]
            duration = body["duration"]
            meet = Meeting.objects.create(university=str(user.name), host_name=host_name, scheduled_date_time = datetime.datetime.strptime(date_time, DATE_FORMAT))
            mid = meet.pk
            meet.channel_name = str(mid) + str(meet.university)
            return JsonResponse({"responseData" :{"created": True, "id" : mid, "university": meet.university, "host_name" : host_name, "scheduled_date_time": str(meet.scheduled_date_time), "duartion": duration}})
        except Exception as e:
            print(e)
            return JsonResponse({"responseData": {"created": False}})



@csrf_exempt
def register_for_meeting(request):
    if request.method == "POST":
        body = json.loads(str((request).body, encoding='utf-8').replace('\'', '\"'))
        try :
            jwt_token = request.headers['Authorization']
            jwt = JWT.objects.get(token = jwt_token)
            user = User.objects.get(jwt = jwt)
            meeting_id = body["meeting_id"]
            meeting = Meeting.objects.get(id = meeting_id)
            if(user.is_student):
                meeting.users.add(user)
                return JsonResponse({"responseData": {"registered": True}})
            else:
                return JsonResponse({"responseData": {"registered": False}})
        except Exception as e:
            print(e)
            return JsonResponse({"responseData": {"registered": False}})


