from django.contrib import admin
from django.urls import path, include
from .views import signup, get_profile, update_profile, add_caretaker, remove_caretaker, activate
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('signup/', signup, name='signup'),
    path('signin/', obtain_auth_token, name='api_token_auth'),
    path('get_profile/', get_profile, name='get_profile'),
    path('update_profile/', update_profile, name='update_profile'),
    path('add_caretaker/', add_caretaker, name='add_caretaker'),
    path('remove_caretaker/', remove_caretaker, name='remove_caretaker'),
    path(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',activate, name='activate'),
]
