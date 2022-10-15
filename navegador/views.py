import imp
import navegador
import json

# Thread
from threading import Thread
 
# Session log
from .session_log import session_log

# Models (mysql)
from .models import Relatorio_e_s_p, Usuario, Pedido, Comanda
# Chatterbot

# Modulos do site / CARDAPIO                             
from .cardapio.principal import *
from .cadastro import *
from .var import *
from .adm.dados_basicos import *

# Django shortcuts imports.
from datetime import datetime, date, time
#from django.core.checks.messages import Error
#from django.shortcuts import render, HttpResponseRedirect
from .adm.horarios import data_hora_imports, dahora       # Derivado do Datetime

# Financeiro/Pagamento QRCODE PIX
from .adm.financeiro.gerador_qrcode_pix import pagamento_pix

# Modulos de criptografia e geradores de chaves.
from .adm.gerador_sm3 import dchavakey_gerador as cripto
from .adm.gerador_cct import *      # Criptografia CPF.

# Modulo login cliente.
from .usuario.login import *

# Modulo login admin.
from .gestor.programs import *
# Metodo de retorno de erros.
from .usuario.cadastro import *

# Modulo cozinha
from .cozinha.gestor import *
def formas_pagamento(request):
    datahora = dahora()

    # condição para acessar a conferencia na pagina-web.
    # se existir um usuario logado... então.
    if 'nickapelido' in request.session:
        usuario = request.session['nickapelido']

        # se existir um pedido para o usuario logado.
        if 'idpedido' in request.session:
            idpedido = request.session['idpedido']

        # se não existir, usuario redirecionado para o cardapio.
        else:
            return HttpResponseRedirect("cardapio")

        # variaveis da conferencia.
        lcomanda = Comanda.objects.filter(comanda=idpedido)
        comanda = []
        vconsumo = 0
        vdesconto = 0

        # formula da tabela
        for l in lcomanda:
            vconsumo += l.valorund * l.qtd
            comanda.append([nome_produto(l.produto), l.qtd,
                           '%.2f' % l.valorund, '%.2f' % (l.valorund*l.qtd),
                            l.idp])

        # condição para o valor da taxa do entregador.
        if vconsumo > 0 and vconsumo < 11:
            vtaxa = 2.95
        elif vconsumo > 10 and vconsumo < 29:
            vtaxa = 3.50
        elif vconsumo > 29 and vconsumo < 40:
            vtaxa = 3.95
        elif vconsumo > 40 and vconsumo < 55:
            vtaxa = 4.40
        elif vconsumo > 55 and vconsumo < 75:
            vtaxa = 4.95
        elif vconsumo > 75 and vconsumo < 95:
            vtaxa = 5
        elif vconsumo > 95 and vconsumo < 110:
            vtaxa = 5.50
        elif vconsumo > 110 and vconsumo < 150:
            vtaxa = 5.95
        else:
            vtaxa = vconsumo*0.06

        # variaveis dos totais
        
        vt = (vconsumo-vdesconto)+vtaxa
        vtotal = '%.2f' % vt
        vconsumo = '%.2f' % vconsumo
        usuario = str(usuario).upper()
        data = date.today()
        pix_gerador = pagamento_pix(usuario, vtotal, idpedido, data)
        chave_copiacola_pix = pix_gerador[0]
        qrcode_pix = pix_gerador[1]
        qrtitulo = pix_gerador[2]
        # retorna resultado dos metodos e variaveis acima.
        return render(request, 'novo_cardapio_pagamento.html', {'titulo': titulo,
                                                 'ncss': ncss,
                                                 'comanda': comanda,
                                                 'vconsumo': vconsumo,
                                                 'vtaxa': vtaxa,
                                                 'vtotal': vtotal,
                                                 'vdesconto': vdesconto,
                                                 'usuario': usuario,
                                                 'idpedido': idpedido,
                                                 'datahora': datahora,
                                                 'qrcode_pix':qrcode_pix,
                                                 'qrtitulo':qrtitulo,
                                                 'chave_copiacola_pix': chave_copiacola_pix,
                                                 'initial_scale': initial_scale,
                                                 'visuald': visuald,
                                                 })


def error(request):
    titulo = 'produto esgotado'
    texto = 'Usuario ou Senha invalidos!'
    return render(request, 'error.html', {'titulo': titulo,
                                          'texto': texto,
                                          'initial_scale': initial_scale,
                                          'visuald': visuald,
                                          'css': css, })


def error2(request):
    titulo = 'produto esgotado'
    texto = 'Este produto encontra-se esgotado!'
    return render(request, 'error2.html', {'titulo': titulo,
                                           'texto': texto,
                                           'initial_scale': initial_scale,
                                           'visuald': visuald,
                                           'css': css, })


def sair(request):
    delv = ['Area de Acesso', 'Usuario', '..', 'Senha', 'Entrar']
    evento = [delv]
    
    try:
        userdb = Usuario.objects.get(usuario=request.session['nickapelido'])
        userdb.status = 0
        userdb.ultimo_logoff = dahora()
        userdb.save()
        del request.session['nickapelido']
        del request.session['idpedido']
       
    except KeyError:
        pass
    return HttpResponseRedirect('/')


def faleconosco(request):
    return render(request, 'fale.html', {'titulo': titulo,
    'initial_scale': initial_scale,
                                         'css': css, })


def registrar(request):
    # print(request.POST['senha'])
    return render(request, 'registrar.html', {})


from .formula import *


def rdd(request):
    vendedor = 'chaves'
    daho = dahora()
    delv = ['Area de Acesso', 'Usuario', '..', 'Senha', 'entrar']
    evento = [delv]
    
    if request.POST:
        try:
            a = len(Relatorio_e_s_p.objects.all()) + 1
            comanda = Comanda.objects.get(idp=request.POST['produto'])
            n = Produtos.objects.get(idprodutos=comanda.produto)
            om = Relatorio_e_s_p(a, datahora=dahora(),cliente=request.session['nickapelido'], vendedor=vendedor, produto=n.idprodutos,comanda=request.session['idpedido'],pedido=request.session['idpedido'],disp_anterior=n.disponibilidade,disp_atual=(n.disponibilidade + comanda.qtd), obs="removido pelo cliente")
            n.disponibilidade = n.disponibilidade + comanda.qtd
            om.save()
            n.save()
            comanda.delete()
            
        except KeyError:
            pass
    return HttpResponseRedirect('pedido')



def add(request):
    delv = ['Area de Acesso', 'Usuario', '..', 'Senha', 'entrar']
    evento = [delv]
    if request.POST:
        try:
            disponibilidade = 0
            vendedor = 'chaves'
            f = 0
            n = Produtos.objects.get(idprodutos=request.POST['produtoid'])
            disponibilidade = n.disponibilidade
            if disponibilidade > 0 and disponibilidade < 4:
                disponibilidade = 'muito baixa'
            elif disponibilidade > 3 :
                disponibilidade = 'baixa'
            else:
                disponibilidade = 'media'
            kl = request.POST['quantidade']
            if kl == '0':
                kl = 1
            if n.disponibilidade > 0 and int(kl) <= n.disponibilidade:
                a = len(Relatorio_e_s_p.objects.all()) + 2
                om = Relatorio_e_s_p(a, datahora=dahora(),cliente=request.session['nickapelido'], vendedor=vendedor, produto=n.idprodutos,comanda=request.session['idpedido'],pedido=request.session['idpedido'],disp_anterior=n.disponibilidade,disp_atual=(n.disponibilidade - int(kl)), obs="adicionado pelo cliente")
                om.save()
                
                n.disponibilidade = n.disponibilidade - int(kl)
                n.save()
            else:
                return render(request, 'error2.html', {'evento': evento,
                                        'css': css,
                                        'disponibilidade': disponibilidade,
                                        'initial_scale': initial_scale,
                                        'visuald': visuald,
                                        'delv': delv, })

            if not 'idpedido' in request.session:
                d = Pedido(
                    cliente=request.session['nickapelido'], datahora=dahora(), status=1)
                d.save()
                historico_pedido = Pedido.objects.filter(
                    cliente=request.session['nickapelido'])
                for m in historico_pedido:
                    if m.status < 14:
                        request.session['idpedido'] = m.idpedido
            for x in range(0, len(promos()), 2):
                if promos()[x] in promos():
                    a = promos()[(promos().index(promos()[x])+1)]
                    if str(n.alergia).__contains__(promos()[x]):
                        f = a

            mtvalor = n.federal + n.estadual + n.icms + n.confins + \
                n.bonus + n.auxinvst + n.reserva + n.regional
            b = len(Comanda.objects.all()) + 1
            cm = Comanda(b, comanda=request.session['idpedido'], produto=request.POST['produtoid'], qtd=kl, vendedor=vendedor,
                         status=0, janela=0, registro=dahora(), valorund=calcular_promo(somar(n.valororiginal, mtvalor), f))
            cm.save()
            session_log(request, ['cardapio', request.session['idpedido'], n])

        except KeyError:
            pass
    return HttpResponseRedirect('../')

def modproduto(request):
    
    delv = ['Area de Acesso', 'Usuario', '..', 'Senha', 'entrar']
    evento = [delv]
    if 'gerentelog' in request.session:
        usuario = request.session['gerentelog']
        if request.POST:
            try:
                n = Produtos.objects.get(idprodutos=request.POST['produtoid'])
                if n.valororiginal != request.POST['valor']:
                    n.valororiginal = float(str(request.POST['valor']).replace(",","."))
                    n.save()

                if n.alergia != request.POST['promo']:
                    n.alergia = str(request.POST['promo'])
                    n.save()

                if n.descr != request.POST['descr']:
                    n.descr = str(request.POST['descr'])
                    n.save()

                if n.tipo != request.POST['tipo']:
                    if n.tipo != '86':
                        n.tipo = int(request.POST['tipo'])
                        n.save()

                if n.nomeoriginal != request.POST['nomes']:
                    n.nomeoriginal = request.POST['nomes']
                    n.save()
                
                if n.nomefantasia != request.POST['nomef']:
                    n.nomefantasia = request.POST['nomef']
                    n.save()

                if n.valororiginal != request.POST['valor']:
                    n.valororiginal = float(str(request.POST['valor']).replace(",", "."))
                    n.save()

                if n.tipo != request.POST['tipo']:
                    n.tipo = request.POST['tipo']
                    n.save()

                if n.disponibilidade != request.POST['quantidade']:
                    n.disponibilidade = int(request.POST['quantidade'])
                    n.save()
                if n.status != request.POST['disponivel']:
                    n.status = int(request.POST['disponivel'])
                    n.save()
                
                if n.federal != request.POST['impfederal']:
                    n.federal = float(str(request.POST['impfederal']).replace(",", "."))
                    n.save()

                if n.estadual != request.POST['impestadual']:
                    n.estadual = float(str(request.POST['impestadual']).replace(",", "."))
                    n.save()
                
                if n.icms != request.POST['impicms']:
                    n.icms = float(str(request.POST['impicms']).replace(",", "."))
                    n.save()

                if n.confins != request.POST['impconfins']:
                    n.confins = float(str(request.POST['impconfins']).replace(",", "."))
                    n.save()
                
                if n.bonus != request.POST['imp1']:
                    n.bonus = float(str(request.POST['imp1']).replace(",", "."))
                    n.save()
                
                if n.auxinvst != request.POST['imp2']:
                    n.auxinvst = float(str(request.POST['imp2']).replace(",", "."))
                    n.save()

                if n.reserva != request.POST['imp3']:
                    n.reserva = float(str(request.POST['imp3']).replace(",", "."))
                    n.save()

                if n.regional != request.POST['imp4']:
                    n.regional = float(str(request.POST['imp4']).replace(",", "."))
                    n.save()

                if n.valorreal != request.POST['valor2']:
                    n.valorreal = float(str(request.POST['valor2']).replace(",", "."))
                    n.save()
                    
                

            except KeyError:
                pass
        return HttpResponseRedirect('/')

    

def editar_produto(request, produto_id):
    titulo_web = f'{produto_id}'
    session_log(request, [titulo_web])
    g = Grupo.objects.filter(visivel=1)
    from .adm.calculos import promos
    promo = []
    for j in promos():
        if str(j).isalpha():
            promo.append(j)
    produto = produto_pesquisa_admin(produto_id)
    if 'gerentelog' in request.session:
        usuario = request.session['gerentelog']
        return render(request, 'painel_produtos_editar.html', {'titulo': titulo,
                                                'usuario': usuario,
                                                'initial_scale': initial_scale,
                                                'ncss': ncss,
                                                'g': g,
                                                'promo': promo,
                                                'produto': produto,
                                                'titulo_web': titulo_web,
                                                'visuald': visualg,
                                                }) 
    else:
        return HttpResponseRedirect('../')   

    
def registro(request):
    return render(request, 'registro.html', {
                                        'css': css,
                                        'initial_scale': initial_scale,
                                        'visuald': visuald,
                                        })

def perfil(request):
    return render(request, 'novo_perfil.html', {'titulo': titulo,
                                        'initial_scale': initial_scale,
                                        'css': css,
                                        'css_card': css_card,
                                        'visuald': visuald,
                                        'css_login': css_login,
                                        })
