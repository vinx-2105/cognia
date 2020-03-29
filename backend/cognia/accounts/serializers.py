from rest_framework import serializers
from .models import Profile
from django.contrib.auth.models import User

class RegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type':'password'}, write_only=True)
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password', 'password2']

        extra_kwargs = {
            'password':{'write_only':True}
        }

    def save(self):
        try:
            user = User.objects.get(email=self.validated_data['email'])
            raise serializers.ValidationError({'email':'email already has a user linked'})
        except:
            try:
                user = User.objects.get(username=self.validated_data['username'])
                raise serializers.ValidationError({'username':'username already in use'})
            except:
                user = User(username = self.validated_data['username'], email = self.validated_data['email'], first_name=self.validated_data['first_name'], last_name=self.validated_data['last_name'])
                password = self.validated_data['password']
                password2 = self.validated_data['password2']

                if password!=password2:
                    raise serializers.ValidationError({'password':'passwords don\'t match'})
                user.set_password(password)
                user.save()
                return user