from .models import Tema
from os import listdir, mkdir
from os.path import isfile, join, isdir, abspath, dirname
from datetime import date
from random import randint

config = Tema.objects.filter(id=1)

titulo = str(config[0].nome_fantasia).title() # Titulo pagina web e nome da loja
nome_fiscal = str(config[0].nome_empresa)
cnpj = str(config[0].cnpj)
cpfreg = str(config[0].keycpf_responsavel)
limite_maquinas = str(config[0].maquinas)
e_endereco = str(config[0].ender).title()
e_complemento = str(config[0].complemento).title()
e_complemento2 = str(config[0].complemento2).title()
e_telefone1 = str(config[0].telefone1)
e_telefone2 = str(config[0].telefone2)
css = 'index_style_v1.css'  # arquivo Style css
ncss = 'lanches_bebidas.css'  # CSS site
css_card = 'cardapio_style_01.css'  # arquivo Style css
css_login = 'login_css2.css'  # arquivo Style css
initial_scale = '0.4.5'  # width=device-width, initial-scale
permitir_multiploacesso = 5 #permite que o mesmo usuario acesse a conta em diversos disposisitovs
t_tema = int(config[0].tema) # Modifica o tema do site
visual = 'visual_1'
resident = f'{abspath(dirname(__file__))}'
path = resident
tematica = open(f'{resident}/static/css/{visual}.css', 'r', encoding='utf-8')
temapadrao = tematica.read()
serial = None
validade = None
registro = None

#parenteses