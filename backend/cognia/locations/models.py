from django.db import models
from accounts.models import Profile
# Create your models here.
class Location(models.Model):
    user_profile = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='locations')
    latitude = models.CharField(max_length=128, null=False, blank=False)
    longitude = models.CharField(max_length=128, null=False, blank=False)
    timestamp = models.DateTimeField(blank=False, null=False)

    def __str__(self):
        return self.user_profile.user.username +" "+ str(self.timestamp)

