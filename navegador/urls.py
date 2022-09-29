from django.urls import path, include
from . import views


urlpatterns = [
    path('pedidodetals/<str:produto_id>', views.pedido_detalhes, name='pedidos'),
    path('', views.cardapio_principal, name='index'),
    path('esgotado', views.error2, name='error2'),
    path('sair', views.sair, name='sair'),
    path('add', views.add, name='add'),
    path('rdd', views.rdd, name='rdd'),
    path('modproduto', views.modproduto, name='add'),
    path('logar', views.logar, name='logar'),
    path('pedido', views.delivery, name='delivery'),
    path('perfil', views.perfil, name='perfil'),
    path('conferencia', views.formas_pagamento, name='formas_pagamento'),
    path('entrar', views.login, name='entrar'),
    path('cardapio', views.cardapio_principal, name='cardapio'),
    path('cadastro', views.cadastro, name='cadastro'),
    path('usuario', views.cadastro2, name='cadastro2'),
    path('ender', views.cadastro3, name='cadastro3'),
    path('categoria/<str:grupo_id>', views.grupo_pesquisa, name='Categorias'),
    path('registro', views.registro, name='registro'),
    path('pesquisa/<str:produto_id>', views.cardapio_produtos, name='produto_id'),
    path('error/<str:erro_id>', views.cadastroe),
    path('cadastro_erro-senha', views.cadastros, name='cadastros'),
    path('cadastro_senhasincorretas', views.cadastros2, name='cadastros2'),
    path('delivery', views.delivery, name='delivery'),
    path('inicio', views.cardapio_principal, name='cardapio'),
    path('paineladm', views.paineladm, name='index'),
    path('config', views.painel_config, name='index'),
    #path('loginadm', views.login_admin, name='index'),
    path('logaradm', views.logar_admin, name='index'),
    path('editar_peroduto/<str:produto_id>', views.editar_produto, name='index'),
    path('sairadm', views.sairadm, name='index'),
    path('produtos', views.painel_produtos, name='index'),
    path('funcionario', views.painel_funcionario, name='index'),
    path('vendas', views.painel_vendas, name='index'),
    path('pagamentos', views.painel_pagamentos, name='index'),


    # URL navegação
    



]
