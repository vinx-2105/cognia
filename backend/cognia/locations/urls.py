from django.contrib import admin
from django.urls import path, include
# from .views import get_user_scores, register_game_score
from rest_framework.authtoken.views import obtain_auth_token
from .views import get_user_location_history, register_user_location, get_user_last_location, get_patients_last_location, get_patients_location_history

urlpatterns = [
    path('get_user_location_history/', get_user_location_history, name='get_user_location_history'),
    path('get_user_last_location/', get_user_last_location, name='get_user_last_location'),
    path('register_user_location/', register_user_location, name='register_user_location'),
    path('get_patients_location_history/', get_patients_location_history, name='get_patients_location_history'),
    path('get_patients_last_location/', get_patients_last_location, name='get_patients_last_location')
]
