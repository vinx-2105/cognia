from django.shortcuts import render
from django.http import HttpResponse
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
from .tokens import *

from django.db import transaction


from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from .tokens import account_activation_token

from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode

from django.core.mail import EmailMessage

# Create your views here.
@csrf_exempt
@api_view(['POST'],)
def signup(request):
    if request.method=='POST':
        serializer = RegistrationSerializer(data=request.data)
        data = {}
        
        if serializer.is_valid():
            with transaction.atomic():
                user = serializer.save()

                # current_site = get_current_site(request)
                # try:
                #     subject = 'Activate Your COGNIA Account'
                #     message =  render_to_string('account_activation_email.html', {
                #         'user': user,
                #         'domain': 'COGNIA',
                #         'uid':urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                #         'token':account_activation_token.make_token(user),
                #     })
                #     to_email = request.data.get('email')
                #     email = EmailMessage(
                #                 subject, message, to=[to_email]
                #     )
                #     email.send()
                # except Exception as e:
                #     print("Exception")
                #     print(e)

                # user.is_active=False
                # user.save()

            data['response'] = 'user successfully created'
            data['email'] = user.email
            data['username'] = user.username
            return Response(data=data, status=HTTP_200_OK)
        else:
            data = serializer.errors
            return Response(data=data, status=HTTP_400_BAD_REQUEST)

@csrf_exempt
def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        return HttpResponse('Thank you for your email confirmation. Now you can login your account.')
    else:
        return HttpResponse('Activation link is invalid!')

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