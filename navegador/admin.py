from django.contrib import admin
from .models import Produtos, Usuario, Pedido, Comanda

# Register your models here.
admin.site.register(Produtos)
admin.site.register(Usuario)
admin.site.register(Pedido)
admin.site.register(Comanda)
