import navegador
import json

# Chatterbot
#from django.views.generic.base import TemplateView
#from django.views.generic import View
#from django.http import JsonResponse
#from chatterbot import ChatBot
#from chatterbot.ext.django_chatterbot import settings

# Thread
from threading import Thread

# Session log
from .session_log import session_log

# Models (mysql)
from .models import Relatorio_e_s_p, Usuario, Pedido, Comanda

# Modulos do site
from .adm.cardapio.grupo1 import secao

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

#from .adm.calculos import calcular_promo, somar, promos           # Calculadoras
                                # Gerador Payload e QR code

# Financeiro/Pagamento QRCODE PIX
from .adm.financeiro.gerador_qrcode_pix import pagamento_pix

# Modulos de Segurança
from .adm.gerador_sm3 import dchavakey_gerador as cripto
from .adm.gerador_cct import *      # Criptografia CPF.


#class ChatterBotAppView(TemplateView):
#    template_name = 'app.html'


#class ChatterBotApiView(View):
#    """
#    Provide an API endpoint to interact with ChatterBot.
#    """
##
 #   chatterbot = ChatBot(**settings.CHATTERBOT)
#
 #   def post(self, request, *args, **kwargs):
 #       """
 #       Return a response to the statement in the posted data.
 #       * The JSON data should contain a 'text' attribute.
 #       """
 #       input_data = json.loads(request.body.decode('utf-8'))
#
 #       if 'text' not in input_data:
  #          return JsonResponse({
   #             'text': [
   #                 'The attribute "text" is required.'
   #             ]
   #         }, status=400)
#
 #       response = self.chatterbot.get_response(input_data)
#
 #       response_data = response.serialize()
#
 #       return JsonResponse(response_data, status=200)
#
 #   def get(self, request, *args, **kwargs):
  #      """
   #     Return data corresponding to the current conversation.
    #    """
     ### })



# Metodo de login no sistema
def logar_sistema(usuario, senha):
    
    userdb = Usuario.objects.get(usuario=usuario)

    if userdb.senha == cripto(usuario, senha):
        if userdb.status == 0:
            return 'verificado'

# Metodo de conferencia da conta.
def cadastroe(request, erro_id):
    e = str('')
    if erro_id == 'euos0001':
        e = 'usuario já existe'
    elif erro_id == 'euos0002':
        e = 'senha invalida'
    elif erro_id == 'euos0003':
        e = 'as senhas não são iguais!'
    elif erro_id == 'euos0004':
        e = 'euos 1025 erro ao cadastrar!'
    elif erro_id == 'euos0006':
        e = 'Usuario já existe!'
    elif erro_id == 'euos0009':
        e = 'usuario ja esta logado!'
        return render(request, 'login.html', {'titulo': titulo,
                                                'ncss': ncss,
                                                'initial_scale': initial_scale,
                                                'e':e,
                                                })

    elif erro_id == 'euos1002':
        e = 'senha invalida!'
        return render(request, 'login.html', {'titulo': titulo,
                                                'ncss': ncss,
                                                'initial_scale': initial_scale,
                                                'e':e,
                                                })
    elif erro_id == 'euos1003':
        e = 'Problema com a senha.'
        return render(request, 'login.html', {'titulo': titulo,
                                                'ncss': ncss,
                                                'initial_scale': initial_scale,
                                                'e':e,
                                                })
    elif erro_id == 'euos1009':
        e = 'Usuario online!'
        return render(request, 'login.html', {'titulo': titulo,
                                                'e':e,
                                                })
    
    else:
        e = 'Error ao cadastrar.'
    
    return render(request, 'novo_cadastro.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              'e':e,
                                              })


def cadastros(request):
    return render(request, 'novo_cadastros.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              })


def cadastros2(request):
    return render(request, 'novo_cadastros2.html', {'titulo': titulo,
                                               'ncss': ncss,
                                               'initial_scale': initial_scale,
                                               })





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
                                                 })
def delivery(request):
    # registra a localização do usuario na pagina-web.
    session_log(request, ['conferencia'])
    # data e hora do sistema.
    linkslogado = ['login']
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
        vendedor = ''

        # formula da tabela
        for l in lcomanda:
            vconsumo += l.valorund * l.qtd
            comanda.append([nome_produto(l.produto), l.qtd,
                           '%.2f' % l.valorund, '%.2f' % (l.valorund*l.qtd),
                            l.idp, l.vendedor])
                            
            vendedor += l.vendedor

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
      
        # retorna resultado dos metodos e variaveis acima.
        return render(request, 'novo_cardapio_conta.html', {'titulo': titulo,
                                                 'ncss': ncss,
                                                 'comanda': comanda,
                                                 'vconsumo': vconsumo,
                                                 'vtaxa': vtaxa,
                                                 'vtotal': vtotal,
                                                 'vdesconto': vdesconto,
                                                 'usuario': usuario,
                                                 'idpedido': idpedido,
                                                 'datahora': datahora,
                                                 'vendedor': vendedor,
                                                 'initial_scale': initial_scale,
                                                 })
    # se não existir usuario logado.
    else:

        # retorna resultado dos metodos e variaveis acima.
        return render(request, 'login2.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              'datahora': datahora,
                                              'css_login': css_login,
                                              'initial_scale': initial_scale,
                                              'linkslogado': linkslogado,
                                              })



def error(request):
    titulo = 'produto esgotado'
    texto = 'Usuario ou Senha invalidos!'
    return render(request, 'error.html', {'titulo': titulo,
                                          'texto': texto,
                                          'initial_scale': initial_scale,
                                          'css': css, })


def error2(request):
    titulo = 'produto esgotado'
    texto = 'Este produto encontra-se esgotado!'
    return render(request, 'error2.html', {'titulo': titulo,
                                           'texto': texto,
                                           'initial_scale': initial_scale,
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


def cadastro(request):
    session_log(request, ['cadastro'])

    if 'nickapelido' in request.session:
        if len(coleta) > 0:
            webpage.append(
                [f"{request.session['nickapelido']} {request.session['pagina']} {dahora()}"])
        else:
            coleta.append([request.session['nickapelido'],
                           request.session.get_expire_at_browser_close(),
                           dahora()])
            webpage.append(
                [f"{request.session['nickapelido']} {request.session['pagina']} {dahora()}"])

    return render(request, 'novo_cadastro.html', {'titulo': titulo,
                                                  'ncss': ncss,
                                                  'initial_scale': initial_scale,
                                            })


def cadastro2(request):
    session_log(request, ['cadastro'])
    if request.POST:
        if 'nickapelido' in request.session:
            if len(coleta) > 0:
                webpage.append(
                    [f"{request.session['nickapelido']} {request.session['pagina']} {dahora()}"])
            else:
                coleta.append([request.session['nickapelido'],
                               request.session.get_expire_at_browser_close(),
                               dahora()])
                webpage.append(
                    [f"{request.session['nickapelido']} {request.session['pagina']} {dahora()}"])

        try:
            userdb = Usuario.objects.get(usuario=request.POST['usuario'])
            if userdb.senha == cripto(request.POST['usuario'], request.POST['senha']):
                clienteid = str(request.POST['usuario']).lower()
                if userdb.status == 0:
                    request.session['nickapelido'] = userdb.usuario
                    request.session.set_expiry(0)
                    request.session.get_expire_at_browser_close(),
                    userdb.status = 1
                    userdb.ultimo_login = dahora()
                    userdb.save()
                    historico_pedido = Pedido.objects.filter(cliente=clienteid)
                    for m in historico_pedido:
                        if m.status < 14:
                            request.session['idpedido'] = m.idpedido

                    return HttpResponseRedirect("./")
                
                else:
                    return HttpResponseRedirect('error/euos0009')
            elif userdb.senha != cripto(request.POST['usuario'], request.POST['senha']):
                return HttpResponseRedirect('error/euos0002')
            else:
                return HttpResponseRedirect('error/euos0006')

        except navegador.models.Usuario.DoesNotExist:

            if request.POST['senha'] <= '' or len(request.POST['senha']) <= 6:
                print(
                    f"""[{dahora()}] não realizado, usuario '{request.POST['usuario']}' senha invalida!""".upper())
                return HttpResponseRedirect("./error/euos0002")
            if request.POST['csenha'] != request.POST['senha']:
                print(
                    f"""[{dahora()}] não realizado, usuario '{request.POST['usuario']}' as senhas não correspondem!""".upper())
                return HttpResponseRedirect("./error/euos0003")

            user_cadastro = Usuario(usuario=request.POST['usuario'], senha=cripto(
                request.POST['usuario'], request.POST['senha']), dataregistro=dahora())
            user_cadastro.save()
            print(
                f"""[{dahora()}] realizado cadastro de '{request.POST['usuario']}' na base de dados.""")

            if request.POST:

                userdb = Usuario.objects.get(usuario=request.POST['usuario'])
                clienteid = str(request.POST['usuario']).lower()
                if userdb.senha == cripto(request.POST['usuario'], request.POST['senha']):
                    request.session['nickapelido'] = userdb.usuario
                    request.session.set_expiry(0)
                    request.session.get_expire_at_browser_close(),
                    historico_pedido = Pedido.objects.filter(cliente=clienteid)
                    for m in historico_pedido:
                        if m.status < 14:
                            request.session['idpedido'] = m.idpedido
                    return HttpResponseRedirect('ender')

    return render(request, 'novo_cadastro2.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              })


def cadastro3(request):
    session_log(request, ['cadastro'])
    if 'nickapelido' in request.session:
        if len(coleta) > 0:
            webpage.append(
                [f"{request.session['nickapelido']} {request.session['pagina']} {dahora()}"])
        else:
            coleta.append([request.session['nickapelido'],
                           request.session.get_expire_at_browser_close(),
                           dahora()])
            webpage.append(
                [f"{request.session['nickapelido']} {request.session['pagina']} {dahora()}"])
    return render(request, 'novo_cadastro3.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              })


