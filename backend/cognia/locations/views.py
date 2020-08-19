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
from rest_framework.parsers import JSONParser,ParseError

from accounts.models import Profile

from django.db import transaction


from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode

from datetime import datetime
from .models import Location

from django.utils.timezone import make_aware

from .models import Location

@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_user_location_history(request):
    if request.method=='POST':
        profile = request.user.profile

        user_locations = Location.objects.filter(user_profile=profile)

        response_data = []

        for loc in user_locations:
            response_data.append(
                {
                    'latitude': loc.latitude,
                    'longitude': loc.longitude,
                    'timestamp': loc.timestamp.strftime("%Y-%m-%d, %H:%M:%S")
                }
            )


        return Response(data=response_data, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_user_last_location(request):
    if request.method=='POST':
        profile = request.user.profile

        user_latest_loc = Location.objects.filter(user_profile=profile).order_by('-timestamp')[0]

        response_data = {
            'latitude': user_latest_loc.latitude,
            'longitude': user_latest_loc.longitude,
            'timestamp': user_latest_loc.timestamp.strftime("%Y-%m-%d, %H:%M:%S")
        }



        return Response(data=response_data, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_patients_last_location(request):
    if request.method=='POST':
        profile = request.user.profile

        response_data = {}

        if profile.role=='Caretaker':
            patients = profile.caretakers.all()
            for patient in patients:
                username = patient.user.username
                user_latest_loc = Location.objects.filter(user_profile=patient).order_by('-timestamp')[0]
                data_obj = {
                    'latitude': user_latest_loc.latitude,
                    'longitude': user_latest_loc.longitude,
                    'timestamp': user_latest_loc.timestamp.strftime("%Y-%m-%d, %H:%M:%S")
                }
                response_data[username] = data_obj

        else:
            return Response(data={'error':'Only caretakers can access this data'}, status=HTTP_400_BAD_REQUEST)

        return Response(data=response_data, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_patients_location_history(request):
    if request.method=='POST':
        profile = request.user.profile

        response_data = {}

        if profile.role=='Caretaker':
            patients = profile.caretakers.all()
            for patient in patients:
                username = patient.user.username
                response_data[username] =[]
                locs = Location.objects.filter(user_profile=patient)
                for loc in locs:
                    data_obj = {
                        'latitude': loc.latitude,
                        'longitude': loc.longitude,
                        'timestamp': loc.timestamp.strftime("%Y-%m-%d, %H:%M:%S")
                    }
                    response_data[username].append(data_obj)

        else:
            return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

        return Response(data=response_data, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)



@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def register_user_location(request):
    print(request)
    if request.method=='POST':
        profile = request.user.profile
        timestamp = datetime.strptime(request.data.get('timestamp'),'%Y-%m-%d %H:%M:%S')
        timestamp = make_aware(timestamp)
        user_loc = Location(user_profile=profile, latitude=request.data.get('latitude'), longitude=request.data.get('longitude'), timestamp=timestamp)
        # print(user_loc)
        user_loc.save()

        return Response(data={'response':'User Location Registered'}, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

