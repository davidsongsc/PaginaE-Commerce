from django.shortcuts import HttpResponseRedirect
from .models import Grupo, Pedido, Produtos
from .adm.calculos import promos, calcular_promo, somar
from .adm.horarios import *

__p = Produtos.objects.filter(tipo=1)
__listaProdutos = []
__listaNomeProdutos = []

for p in __p:
    if p.status == 0:
        __listaNomeProdutos.append(p.nomefantasia)
        __listaProdutos.append([p.nomeoriginal, p.disponibilidade, p.descr])

def produto_pesquisa(nome_produto:str):
    try:
        produtos = Produtos.objects.filter(nomeoriginal=nome_produto)
        if not produtos[0].tipo > len(Grupo.objects.all()):
            prlist = []
            for n in produtos:
                if n.status == 0:
                    destaque = []
                    alerta = []
                    d = 0
                    for x in range(0, len(promos()), 2):
                            if promos()[x] in promos():
                                a = promos()[(promos().index(promos()[x])+1)]
                                if str(n.alergia).__contains__(promos()[x]):
                                    d = a
                                    if str(n.alergia).__contains__(promos()[x]):
                                        destaque.append(promos()[x])
                                                                    
                    mtvalor = n.federal + n.estadual + n.icms + n.confins + \
                            n.bonus + n.auxinvst + n.reserva + n.regional
                    prlist.append([n.idprodutos, n.nomeoriginal, n.nomefantasia,
                                        calcular_promo(somar(n.valororiginal, mtvalor), d), n.descr, alerta, destaque, n.tipo, n.federal, n.estadual, n.icms, n.confins,\
                                            n.bonus, n.auxinvst, n.reserva, n.regional, n.valorreal, n.disponibilidade])
                return prlist
    except IndexError:
        print("invalido")


def produto_pesquisa_admin(nome_produto:str):
    try:
        produtos = Produtos.objects.filter(nomeoriginal=nome_produto)
        if not produtos[0].tipo > len(Grupo.objects.all()):
            prlist = []
            
            for n in produtos:
                destaque = []
                alerta = []
                d = 0
                for x in range(0, len(promos()), 2):
                        if promos()[x] in promos():
                            a = promos()[(promos().index(promos()[x])+1)]
                            if str(n.alergia).__contains__(promos()[x]):
                                d = a
                                if str(n.alergia).__contains__(promos()[x]):
                                    destaque.append(promos()[x])
                                                                
                
                mtvalor = n.federal + n.estadual + n.icms + n.confins + \
                        n.bonus + n.auxinvst + n.reserva + n.regional
                prlist.append([n.idprodutos, n.nomeoriginal, n.nomefantasia,
                                    calcular_promo(somar(n.valororiginal, mtvalor), d), n.descr, alerta, destaque, n.tipo, n.federal, n.estadual, n.icms, n.confins,\
                                        n.bonus, n.auxinvst, n.reserva, n.regional, n.valorreal, n.disponibilidade, n.valororiginal, n.alergia])
            return prlist
    except IndexError:
        print("invalido")

def produto_cardapio_menu(produto_id_grupo):
    # Listagem de produtos
    base_produtos = Produtos.objects.filter(tipo=produto_id_grupo)
    base_listagem_produtos = []
    for n in base_produtos:
        if n.disponibilidade > 0 and n.status ==0 or n.status ==2:
            destaque = []
            alerta = []
            d = 0
            for x in range(0, len(promos()), 2):
                if promos()[x] in promos():
                    a = promos()[(promos().index(promos()[x])+1)]
                    if str(n.alergia).__contains__(promos()[x]):
                        d = a
                        if str(n.alergia).__contains__(promos()[x]):
                            destaque.append(promos()[x])

            
            mtvalor = n.federal + n.estadual + n.icms + n.confins + \
                n.bonus + n.auxinvst + n.reserva + n.regional
            base_listagem_produtos.append([n.idprodutos, n.nomeoriginal, n.nomefantasia,
                            calcular_promo(somar(n.valororiginal, mtvalor), d), n.descr, alerta, destaque, n.tipo])
        
    return base_listagem_produtos


def t_grupos():
    links = []
    # gp = Grupo.objects.all()
    gp = Grupo.objects.filter(visivel=1)
    
    for grupo in gp:
        links.append([grupo.nome_grupo, grupo.descr, grupo.nome_grupo])
    return [links]