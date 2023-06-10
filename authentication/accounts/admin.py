from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from .forms import UserChangeForm, UserCreationForm
from .models import User


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm
    list_display = ['pk', 'email', 'first_name', 'last_name']
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email', )
    fieldsets = ()
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password'),
        }),
    )
    filter_horizontal = ()
