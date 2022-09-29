from .models import Grupo, Produtos
todos_produtos = Produtos.objects.all()
todos_grupos = Grupo.objects.all()

def nome_produto(id):
    for tt in todos_produtos:
        if tt.idprodutos == id:
            id = tt.nomefantasia
    return id

def nome_grupo(id):
    for tt in todos_grupos:
        if tt.id_grupo == id:
            id = tt.nome_grupo
    return id