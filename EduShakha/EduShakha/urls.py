from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from . import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.decorators.csrf import csrf_exempt


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('', include('users.urls')),

] + staticfiles_urlpatterns() +\
              static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)