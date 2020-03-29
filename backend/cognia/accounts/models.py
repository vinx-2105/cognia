from django.db import models
from django.contrib.auth.models import User

from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, related_name='profile', on_delete=models.CASCADE)
    gender = models.CharField(max_length=1)
    role = models.CharField(max_length=10)
    caretakers = models.ManyToManyField("self")

    def __str__(self):
        return self.user.first_name + " "+self.user.last_name

@receiver(post_save, sender=User)
def update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()

