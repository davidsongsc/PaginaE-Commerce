from ..var import *
from ..adm.gerador_sm3 import dchavakey_gerador as cripto
from ..models import Usuario, Pedido, Comanda
from ..session_log import session_log
from ..adm.horarios import dahora
from django.shortcuts import render, HttpResponseRedirect
from ..adm.dados_basicos import *
from ..nome_produto import *
from ..gestor.programs import visuald

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
                                                'visuald': visuald,
                                                })

    elif erro_id == 'euos1002':
        e = 'senha invalida!'
        return render(request, 'login.html', {'titulo': titulo,
                                                'ncss': ncss,
                                                'initial_scale': initial_scale,
                                                'e':e,
                                                'visuald': visuald,
                                                })
    elif erro_id == 'euos1003':
        e = 'Problema com a senha.'
        return render(request, 'login.html', {'titulo': titulo,
                                                'ncss': ncss,
                                                'initial_scale': initial_scale,
                                                'e':e,
                                                'visuald': visuald,
                                                })
    elif erro_id == 'euos1009':
        e = 'Usuario online!'
        return render(request, 'login.html', {'titulo': titulo,
                                                'ncss': ncss,
                                                'initial_scale': initial_scale,
                                                'e':e,
                                                'visuald': visuald,
                                                })
    
    else:
        e = 'Error ao cadastrar.'
    
    return render(request, 'novo_cadastro.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              'e':e,
                                              'visuald': visuald,
                                              })


# Pagina de Cadastro 1.
def cadastros(request):
    return render(request, 'novo_cadastros.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              'visuald': visuald,
                                              })
# Pagina de Cadastro 2.
def cadastros2(request):
    return render(request, 'novo_cadastros2.html', {'titulo': titulo,
                                               'ncss': ncss,
                                               'initial_scale': initial_scale,
                                               'visuald': visuald,
                                               })

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
                                                 'visuald': visuald,

                                            })

import navegador.models
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
                                              'visuald': visuald,
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
                                              'visuald': visuald,
                                              })
    else:
        return HttpResponseRedirect("cardapio")

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
                                                 'cnpj': cnpj,
                                                 'cpfreg': cpfreg,
                                                 'nome_fiscal': nome_fiscal,
                                                 'limite_maquinas': limite_maquinas,
                                                 'e_endereco': e_endereco,
                                                 'e_complemento': e_complemento,
                                                 'e_complemento2': e_complemento2,
                                                 'e_telefone1': e_telefone1,
                                                 'e_telefone2': e_telefone2,
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
                                                 'visuald': visuald,
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
                                              'visuald': visuald,
                                              })


