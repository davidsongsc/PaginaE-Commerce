from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.cardapio, name='cardapio'),
    path('cardapio', views.cardapio, name='cardapio'),
    path('delivery', views.delivery, name='delivery'),
    path('pedido', views.delivery, name='delivery'),
    path('fale-conosco', views.faleconosco, name='faleconosco'),
    path('entrar', views.login, name='entrar'),
    path('logar', views.logar, name='logar'),
    path('cadastro', views.cadastro, name='cadastro'),
    path('usuario', views.cadastro2, name='cadastro2'),
    path('ender', views.cadastro3, name='cadastro3'),
    path('error', views.error, name='error'),
    path('esgotado', views.error2, name='error2'),
    path('sair', views.sair, name='sair'),
    path('inicio', views.cardapio, name='cardapio'),
    path('add', views.add, name='add'),
]
