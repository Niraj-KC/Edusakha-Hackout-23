from django.core.mail import EmailMessage, get_connection
from django.shortcuts import render, redirect
from django.core.mail import send_mail, BadHeaderError
from django.http import HttpResponse, response, JsonResponse
from django.contrib.auth.forms import PasswordResetForm
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes, force_text
from django.contrib.auth import authenticate
import json
import os
from django.contrib.auth import get_user_model
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail
from django.views.decorators.csrf import ensure_csrf_cookie
from .models import User, JWT, PRToken
from django.db import IntegrityError
from django.core.mail import send_mail
import EduShakha.settings as settings
import datetime
from django.core.files import File


# Create your views here.
def register_uni(request):
    if request.method == 'POST':
        body = json.loads(request.body.decode('utf-8'))
        email = body["email"]
        password = body["password"]
        name = body["name"]
        address = body["address"]
        website = body["website"]
        try : 
            user = User.objects.create_user(email = email, password = password)
            user.is_university = True
            user.name = name
            user.address = address
            user.website = website
            user.save()
            jwt = JWT.objects.create(user = user)
            jwt.save()
            print("HERE")
            # user.delete()
            return JsonResponse({"responseData" :{"created": True, "token": str(jwt.token), 'is_student': user.is_student, 'is_university': user.is_university,  "dp_path" : ''}})
        except Exception as e:
            return JsonResponse({"responseData" : {"created": False}})

def register_student(request):
    if request.method == 'POST':
        body = json.loads(request.body.decode('utf-8'))
        email = body["email"]
        dob = body["dob"]
        name = body["name"]
        password = body["password"]
        try : 
            date_str = '07/12/2022'   
            format_str = '%d/%m/%Y'  
            user = User.objects.create_user(email = email, password = password)
            user.name = name
            print("here")
            user.dob = datetime.datetime.strptime(dob, format_str).date()
            user.save()
            jwt = JWT.objects.create(user = user)
            jwt.save()
            if(user.is_university):
                return JsonResponse({"responseData" :{"created": True, "token": str(jwt.token), 'is_student': user.is_student, 'is_university': user.is_university, 'dp_url': user.photo.url}})
            else:
                return JsonResponse({"responseData" :{"created": True, "token": str(jwt.token), 'is_student': user.is_student, 'is_university': user.is_university}})
        except Exception as e:
            return JsonResponse({"responseData" : {"created": False}})

def login(request):
    if request.method == "POST":
        body=json.loads(request.body.decode("utf-8"))
        email = body["email"]
        password = body["password"]
        print(email, password)
        if(authenticate(email=email, password=password)):
            print("Here")
            user = User.objects.all().filter(email=email)
            jwt = JWT.objects.all().filter(user = user[0])
            for token in jwt:
                token.delete()
            jwt = JWT.objects.create(user = user[0])
            print(user[0].name)
            if(user[0].is_university):
                return JsonResponse({"responseData" :{"isAuthenticated": True, "token": str(jwt.token), 'is_student': user[0].is_student, 'is_university': user[0].is_university, "dp_path" : user[0].photo.url if user[0].photo else '', 'name': user[0].name, 'email': user[0].email}})
            else:
                return JsonResponse({"responseData" :{"isAuthenticated": True, "token": str(jwt.token), 'is_student': user[0].is_student, 'is_university': user[0].is_university, 'name': user[0].name, 'email': user[0].email}})
        else:
            return JsonResponse({"responseData" : {"isAuthenticated": False}})

def is_logged_in(request):
    if(request.method == "POST"):
        print(request.headers)
        jwt_token = request.headers['Authorization']
        try:
            jwt = JWT.objects.get(token = jwt_token)
            user = User.objects.get(jwt = jwt)
            print(user)
            return JsonResponse({"responseData" :{"isLoggedIn": True, "userID": str(user.custom_id), "userEmail" : str(user)}})
        except Exception as e:
            print(e)
            return JsonResponse({"responseData" :{"isLoggedIn": False}})

def forgot_password(request):
    if (request.method=="GET") :
        pass
    elif (request.method == "POST"):
        body=json.loads(request.body.decode("utf-8"))
        try:
            user = User.objects.get(email = body["email"])
        except Exception as e:
            print(e)
            return JsonResponse({"responseData" :{"emailValid": False, "emailSent": False}})
        try:
            prevTokens = PRToken.objects.all().filter(user = user)
            for token in prevTokens:
                token.delete()
            prToken = PRToken.objects.create(user= user)
            
            with get_connection(  
                host=settings.EMAIL_HOST, 
                port=settings.EMAIL_PORT,  
                username=settings.EMAIL_HOST_USER, 
                password=settings.EMAIL_HOST_PASSWORD, 
                use_tls=settings.EMAIL_USE_TLS  
                ) as connection: 
                print(body["email"])
                EmailMessage(
                "Subject here",
                f"Link : {settings.WEBSITE_URL}/change-forgotten-password/{str(prToken.token)}/",
                settings.EMAIL_HOST_USER,
                [user.email],
                connection=connection,
        ).send()   
            return JsonResponse({"responseData" :{"emailValid": True, "emailSent" : True}})
        except Exception as e:
            print(e)
            return JsonResponse({"responseData":{"emailValid":False,"emailSent":False}})

def change_forgotten_passwrd(request, token):
    if(request.method == 'GET'):
        pass
    elif(request.method == "POST"):
        body = json.loads(request.body.decode('utf-8'))
        try:
            prToken = PRToken.objects.get(token = token)
            user = User.objects.get(prtoken = prToken)
            new_pass = body["newPassword"]
            user.set_password(new_pass)
            user.save()
            return JsonResponse({"responseData": {"validToken": True}})
        except Exception as e:
            print(e)
            return JsonResponse({"responseData": {"validToken": False}})

def upload_dp(request):
    if request.method == "POST":
        try:
            jwt_token = request.headers['Authorization']
            jwt = JWT.objects.get(token = jwt_token)
            user = User.objects.get(jwt = jwt)
            if(not user.is_university):
                return JsonResponse({"responseData": {"uploaded": False}})
            
            print(user.photo)
            file_ = request.FILES['DP']
            filename1 = datetime.datetime.now().strftime("%Y%m%d-%H%M%S") + ".jpg"
            with open(f"MEDIA/uploads/{filename1}", "wb+") as f:
                for chunk in file_.chunks():
                    f.write(chunk)
                user.photo = File(f, os.path.basename(f.name))
                user.save()
            # user.photo = request.FILES['DP']
            return JsonResponse({"responseData": {"uploaded": True}})
        except Exception as e:
            print(e)
            return JsonResponse({"responseData": {"uploaded": False}})



