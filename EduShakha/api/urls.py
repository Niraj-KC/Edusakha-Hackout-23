
from django.contrib import admin
from django.urls import path
from .views import model, schedule_meeting, register_for_meeting
urlpatterns = [
    path('model/', model),
    path('schedule-meeting/', schedule_meeting),
    path('register-for-meeting/', register_for_meeting),
]