from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models


from .managers import UserManager


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField('email', max_length=255, unique=True)
    first_name = models.CharField('first_name', max_length=255, null=True, blank=True)
    last_name = models.CharField('last_name', max_length=255, null=True, blank=True)
    is_active = models.BooleanField('is_active', default=True)
    is_staff = models.BooleanField('is_staff', default=False)
    is_verified = models.BooleanField('is_verified', default=False)

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name']

    class Meta:
        verbose_name = 'пользователь'
        verbose_name_plural = 'пользователи'
