from django.contrib import admin
from .models import User, JWT, PRToken, Meeting
# Register your models here.
admin.site.register(User)
admin.site.register(JWT)
admin.site.register(PRToken)
admin.site.register(Meeting)
