import datetime
import os
from django.utils.functional import cached_property
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
import string
import random
from django.contrib.auth.hashers import make_password
import glob
import uuid


id_length = 20

token_length = 34




def make_custom_user_id():
    satisfied = False
    while not satisfied:
        custom_string = ''.join(random.choice(
            string.ascii_uppercase) for _ in range(id_length))
        check_list = list(User.objects.filter(custom_id=custom_string))
        if len(check_list) == 0:
            satisfied = True

    return custom_string


class MyUserManager(BaseUserManager):
    def create_user(self, email, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('Users must have an email address.')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email=email,
            password=password,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


    

class User(AbstractBaseUser):
    custom_id = models.CharField(
        max_length=id_length, null=False, blank=False, editable=False, unique=True)
    email = models.EmailField(
        max_length=240, null=False, blank=False, unique=True)
    name = models.CharField(max_length = 255, null=False, blank=False, editable=True, unique=False)
    # STUDENT FIELDS
    is_student = models.BooleanField(default=True)
    dob = models.DateField()
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    # UNIVESITY FIELDS
    is_university = models.BooleanField(default=False)
    address = models.CharField(max_length=500, null=False, blank=False)
    website = models.URLField(null=False, blank=False)
    photo = models.FileField(upload_to='uploads/')

    USERNAME_FIELD = 'email'

    objects = MyUserManager()

    def get_upload_path(self, filename):
        return f'UserSpecific/{self.email}/DisplayPicture/{str(datetime.datetime.now())}.webp'

    @staticmethod
    def get_universities():
        return User.objects.all().filter(is_university = True)
    @staticmethod
    def get_students():
        return User.objects.all().filter(is_student = True)

    def save(self, *args, **kwargs):
        # delete old file when replacing by updating the file
        if self.custom_id == '' or self.custom_id is None:
            self.custom_id = make_custom_user_id()
        try:
            this = User.objects.get(pk=self.pk)
            # if this.display_picture != self.display_picture:
        except:
            pass  # when new photo then we do nothing, normal case
        super(User, self).save(*args, **kwargs)

    @property
    def is_authenticated(jwt_token):
        try:
            jwt__ = JWT.objects.get(token = jwt_token)
            user = User.objects.get(jwt = jwt__)
            return user
        except Exception as e:
            print(e)
            return None

    def get_registered_meetings(self):
        meetings

    def delete(self, *args, **kwargs):
        delete_folder(f'media/UserSpecific/{self.email}/')
        super(User, self).delete(*args, **kwargs)

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return self.is_admin or self.is_superuser

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin

    def __str__(self):
        return str(self.email)


class Meeting(models.Model):
    channel_name = models.CharField(max_length = 255, blank = False, null = False)
    university = models.CharField(max_length = 255, blank=False, null=False)
    users = models.ManyToManyField(User)
    host_name = models.CharField(null=False, blank=False, max_length=255)
    schedudled_date_time = models.DateTimeField(blank=False, null=False)
    time_in_minutes = models.IntegerField(default=30, null=False, blank=False)

    def get_regestered_users():
        return self.users

class JWT(models.Model):
    token = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, null=False, blank=False, unique=True)
    user = models.OneToOneField(User, on_delete = models.CASCADE)
    creation_time = models.DateTimeField(auto_now_add=True, blank=True)

    def save(self, *args, **kwargs):
        super(JWT, self).save(*args, **kwargs)

    def __str__(self):
        return str(str(self.user)+ " " + str(self.token))

class PRToken(models.Model):
    token = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, null=False, blank=False, unique=True)
    user = models.OneToOneField(User, on_delete = models.CASCADE)
    creation_time = models.DateTimeField(auto_now_add=True, blank=True)

    def save(self, *args, **kwargs):
        super(PRToken, self).save(*args, **kwargs)

    def __str__(self):
        return str(str(self.user)+ " " + str(self.token))

    