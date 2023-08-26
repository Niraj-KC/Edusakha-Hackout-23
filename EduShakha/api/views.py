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
from django.contrib.auth.models import User

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


