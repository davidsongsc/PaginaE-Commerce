from ..adm.gerador_sm3 import dchavakey_gerador as cripto
from ..models import Usuario, Pedido, Colaborador
from ..session_log import session_log
from ..adm.horarios import dahora
from django.shortcuts import render, HttpResponseRedirect
from ..adm.dados_basicos import *
from ..var import *
from ..gestor.programs import visuald

def login(request):
    session_log(request, ['login'])
    if 'nickapelido' in request.session:
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
        return render(request, 'error2.html', {'css': css,
                                               'initial_scale': initial_scale,})


    return render(request, 'login.html', {'titulo': titulo,
                                          'initial_scale': initial_scale,
                                          'css': css,
                                          'css_card': css_card,
                                          'css_login': css_login,
                                          'visuald': visuald,
                                          })


def logar_sistema(usuario, senha):
    userdb = Usuario.objects.get(usuario=usuario)
    if userdb.senha == cripto(usuario, senha):
        if userdb.status == 0:
            return 'verificado'

def logar(request):
    session_log(request, ['logar'])
    try:
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
        if 'nickapelido' in request.session:
            return HttpResponseRedirect('/')

        if request.POST:
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
                try:
                    funcionario = Colaborador.objects.get(login=request.POST['usuario'])
                    if funcionario.passweb == cripto(request.POST['usuario'], request.POST['senha']):
                        if funcionario.status == 0:
                            funcionario.status = 1
                            funcionario.save()
                            request.session['gerentelog'] = funcionario.login
                            request.session.set_expiry(0)
                            return HttpResponseRedirect('/')
                        else: 
                            return HttpResponseRedirect('error/euos1009')
                except :
                    pass
                
                
                else:
                    return HttpResponseRedirect('error/euos1009')
            elif userdb.senha != cripto(request.POST['usuario'], request.POST['senha']):
                return HttpResponseRedirect('error/euos1002')
            else:
                return HttpResponseRedirect('error/euos1006')
        
        return HttpResponseRedirect('/')
    except Usuario.DoesNotExist:
        titulo = ""
        linkslogado = ['login']
        return render(request, 'login.html', {'titulo': titulo,
                                              'ncss': ncss,
                                              'initial_scale': initial_scale,
                                              'css_login': css_login,
                                              'css_card': css_card,
                                              'initial_scale': initial_scale,
                                              'linkslogado': linkslogado,
                                              'visuald': visuald,
                                              })

