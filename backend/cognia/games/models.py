from django.db import models
from accounts.models import Profile
# Create your models here.
class GameScore(models.Model):
    user_profile = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='game_scores')
    duration = models.IntegerField(blank=False, null=False)
    moves = models.IntegerField(blank=False, null=False)
    timestamp = models.DateTimeField(blank=False, null=False)

    def __str__(self):
        return self.user_profile.user.username + " " + str(self.timestamp)