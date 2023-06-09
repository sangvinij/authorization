from django.urls import include, path, re_path

from rest_framework.routers import DefaultRouter

router = DefaultRouter()

urlpatterns = [
    path(r'', include(router.urls)),
    path(r'auth/', include('djoser.urls')),
    re_path(r'auth/', include('djoser.urls.authtoken')),
]
