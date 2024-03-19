from django.contrib import admin

# Register your models here.
from .models import Todo

class AdminTodo(admin.ModelAdmin):
    list_display = ('id','title', 'description', 'image')


admin.site.register(Todo, AdminTodo)
