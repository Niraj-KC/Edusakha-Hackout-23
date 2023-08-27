
from django.contrib import admin
from django.urls import path
from .views import register_uni, register_student, login, is_logged_in, forgot_password, change_forgotten_passwrd, upload_dp
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('signup/uni/', csrf_exempt(register_uni)),
    path('signup/student/', csrf_exempt(register_student)),
    path('login/', csrf_exempt(login)),
    path('is-logged-in/', csrf_exempt(is_logged_in)),
    path('forgot-password/', csrf_exempt(forgot_password)),
    path('change-forgotten-password/<token>/', csrf_exempt(change_forgotten_passwrd)),
    path('upload-dp/', csrf_exempt(upload_dp))
]