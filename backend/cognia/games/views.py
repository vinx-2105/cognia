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

from .models import Profile

from django.db import transaction


from django.contrib import messages
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode

from datetime import datetime
from .models import GameScore

@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def get_user_scores(request):
    if request.method=='POST':
        user = request.user 
        profile = user.profile

        user_game_scores = GameScore.objects.filter(user_profile=profile)
        
        response_data = []

        for score in user_game_scores:
            response_data.append(
                {
                    'duration': score.duration,
                    'moves': score.moves,
                    'timestamp': score.timestamp.strftime("%Y-%m-%d, %H:%M:%S")
                }
            )


        return Response(data=response_data, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def register_game_score(request):
    print(request)
    if request.method=='POST':
        profile = request.user .profile
        # # 2020-08-18T12:19:19Z
        timestamp = datetime.strptime(request.data.get('timestamp'),'%Y-%m-%d %H:%M:%S')
        user_game_score = GameScore(user_profile=profile, moves=int(request.data.get('moves')), duration=int(request.data.get('duration')), timestamp=timestamp)
        user_game_score.save()

        return Response(data={'response':'Game Score Registered'}, status=HTTP_200_OK)
    return Response(data={'error':'invalid request'}, status=HTTP_400_BAD_REQUEST)

