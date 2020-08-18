from django.contrib import admin
from django.urls import path, include
from .views import get_user_scores, register_game_score
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('get_user_scores/', get_user_scores, name='get_user_scores'),
    path('register_game_score/', register_game_score, name='register_game_score'),

]
