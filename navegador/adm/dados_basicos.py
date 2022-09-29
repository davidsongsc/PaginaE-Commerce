from ..models import Produtos, Grupo
from threading import Thread

t = Produtos.objects.all()
listagem_produtos = []
for m in t:
    listagem_produtos.append(str(m.nomefantasia))
    listagem_produtos.append(str(f'Conhece {m.nomefantasia}? {m.descr}'))

grupo_categorias = Grupo.objects.filter(visivel=1)
categorias_site = []
for gr in grupo_categorias:
    categorias_site.append([gr.link])


webpage = []  # Localização do usuario na pagina web
links = [
    ['delivery', 'delivery'],
]
linkslogado = []
coleta = []



