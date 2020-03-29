from django.shortcuts import render

from django.contrib.auth.models import User
from django.contrib.auth import authenticate

from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token

from rest_framework.authentication import TokenAuthentication
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from rest_framework.response import Response

from .serializers import RegistrationSerializer

from .models import Profile


# Create your views here.
@csrf_exempt
@api_view(['POST'],)
def signup(request):
    if request.method=='POST':
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            user = serializer.save()
            data['response'] = 'new user created successfully'
            data['email'] = user.email
            data['username'] = user.username
            return Response(data=data, status=HTTP_200_OK)
        else:
            data = serializer.errors
            return Response(data=data, status=HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_profile(request):
    if request.method=='POST':
        user = request.user 
        profile = user.profile
        data = {
            'email':user.email,
            'username':user.username,
            'first_name':user.first_name, 
            'last_name':user.last_name,
            'gender': profile.gender,
            'role': profile.role,
            'caretakers':[str(caretaker) for caretaker in profile.caretakers.all()]
        }
        return Response(data=data, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

# api for updating the profile...i.e gender and role
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def update_profile(request):
    if request.method=='POST':
        profile = request.user.profile
        _gender = request.data.get('gender')
        _role = request.data.get('role')
        profile.gender = _gender
        profile.role = _role
        profile.save()
        return Response(data={'response':'Profile Updated'}, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

#add caretaker
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def add_caretaker(request):
    if request.method=='POST':
        #check if the user is user entered is a valid user of app
        _ct_username = request.data.get('caretaker')
        try:
            _ct_user = User.objects.get(username = _ct_username)
            _ct_profile = _ct_user.profile
            if _ct_profile.role=='Caretaker':
                request.user.profile.caretakers.add(_ct_profile)
        except:
            return Response(data={'error':'{} is Not Registered as a Caretaker'.format(_ct_username)}, status=HTTP_400_BAD_REQUEST)
        return Response(data={'response':'Profile Updated'}, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

#remove caretaker
@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def remove_caretaker(request):
    if request.method=='POST':
        #check if the user is user entered is a valid user of app
        _ct_username = request.data.get('caretaker')
        try:
            _ct_user = User.objects.get(username = _ct_username)
            _ct_profile = _ct_user.profile
            request.user.profile.caretakers.remove(_ct_profile)
        except:
            return Response(data={'error':'{} is Not Registered as a Caretaker'.format(_ct_username)}, status=HTTP_400_BAD_REQUEST)
        return Response(data={'response':'Profile Updated'}, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)