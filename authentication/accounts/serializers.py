from djoser.serializers import UserCreateSerializer

from .models import User


class CreateUserSerializer(UserCreateSerializer):
    class Meta:
        model = User
        fields = ('email', 'password', 'first_name', 'last_name')
