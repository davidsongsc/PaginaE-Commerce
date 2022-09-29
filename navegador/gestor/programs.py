from operator import contains
from unittest import case
from django.shortcuts import render, HttpResponseRedirect
from ..models import Colaborador, Pagamentos, Produtos, Comanda
from ..nome_produto import *
from ..adm.gerador_sm3 import dchavakey_gerador
from ..adm.horarios import *
from ..gestor.temas import visuald, visualg
from ..var import *
from ..adm.nivel_colaborador import definodor_nivel
import socket


ipsocket = socket.gethostbyname(socket.gethostname())
cripto = dchavakey_gerador
# Create your views here.
coleta = []
webpage = []



def paineladm(request):
    try:
        if not 'gerentelog' in request.session:
            return HttpResponseRedirect('loginadm')
    except paineladm:
        pass
    
    return render(request, 'painel_admin.html', {'visuald': visualg, 'titulo':titulo})

def painel_config(request):
    try:
        if not 'gerentelog' in request.session:
            return HttpResponseRedirect('loginadm')
    except paineladm:
        pass
    return render(request, 'painel_config.html', {'visuald': visualg, 'titulo':titulo,
                                                  'ipsocket': ipsocket,})

def painel_produtos(request):
    try:
        produto = Produtos.objects.all()
        if not 'gerentelog' in request.session:
            return HttpResponseRedirect('loginadm')
    except paineladm:
        pass
    return render(request, 'painel_produtos.html', {'produto': produto})

def painel_funcionario(request):
    try:
        pglista_ = []
        totalm = 0
        venda = 89000
        gorjeta = '%.2f' % (venda*0.105)
        total_horas = 0
        total_horaspg = 0
        funcionario = []
        tfun = 0
        tfuna = 0
        tbns = 0
        #print(Colaborador.objects.all())
        for g in Colaborador.objects.all():
            if g.funcao[0] != '9':
                total_horaspg += g.horas_escala
        for g in Colaborador.objects.all():
            valor = g.sbase
            valor_bonus = (g.sbase*0.03)*int(g.funcao[0])
            valor_total =valor + valor_bonus
            valor_bonus = float('%.2f' % valor_bonus)
            valor_total = float('%.2f' % valor_total)
            cargahoraria = g.horas_escala
            total_horas += g.horas_escala
            dias_trabalhados = g.dias_escala
            total_trabalhado =  (valor_total*cargahoraria)
            total_trabalhado = float('%.2f' % total_trabalhado)
            totalm += (valor_total*cargahoraria)
            totalm = float('%.2f' % totalm)
            pglista_.append([g.login, total_trabalhado])
            tfun += 1
            if g.funcao[0] != '9':
                gtotal_horas = '%.2f' % (float(gorjeta)/float(total_horaspg)*g.horas_escala)
                tbns += float(gorjeta)/float(total_horaspg)
            else:
                gtotal_horas = 0
                tbns += 0
            if g.status == 1:
                tfuna +=1
                funcionario.append([g.login, g.pessoa, definodor_nivel(int(g.funcao)), valor, valor_bonus, valor_total, cargahoraria, dias_trabalhados, total_trabalhado, gtotal_horas, (float(total_trabalhado)+float(gtotal_horas))])
        if not 'gerentelog' in request.session:
            return HttpResponseRedirect('paineladm')
    except paineladm:
        pass

    return render(request, 'painel_funcionarios.html', {'funcionario': funcionario,
                                                                'totalm': totalm,
                                                                'venda': venda,
                                                                'gorjeta': gorjeta,
                                                                'total_horas': total_horas,
                                                                'gtotal_horas': gtotal_horas,
                                                                'pglista_': pglista_,
                                                                'tfun': tfun,
                                                                'tfuna': tfuna,
                                                                'tbns': tbns,
                                                                'visuald': visualg,
                                                                })

def painel_vendas(request):
    try:
        if not 'gerentelog' in request.session:
            return HttpResponseRedirect('paineladm')
    except paineladm:
        pass
    venda = Comanda.objects.all()
    hoje = []
    comanda_listagem = []
    total = 0
    data_hoje = data_corrente()
    for i in venda:
        if data_hoje in str(i.registro):
            hoje.append(i)
            comanda_listagem.insert(0, [i.comanda, nome_produto(i.produto), i.vendedor, i.valorund*i.qtd])
            total += i.valorund*i.qtd
    
    return render(request, 'painel_vendas.html', {'hoje': hoje,
                                                         'total': total,
                                                         'data_hoje': data_hoje,
                                                         'visuald': visualg,
                                                         'comanda_listagem': comanda_listagem})

def painel_pagamentos(request):
    try:
        if not 'gerentelog' in request.session:
            return HttpResponseRedirect('/paineladm')
    except paineladm:
        pass
    pagamento_recebido = Pagamentos.objects.all()
    hoje = []
    pagamento_listagem = []
 
    total = 0
    data_hoje = data_corrente()
    for i in pagamento_recebido:
        if data_hoje in str(i.registro):
            hoje.append(i)
            pagamento_listagem.insert(0, [i.primaria, i.pedido,i.valorpago , i.bandeira])
            total += i.valorpago

    return render(request, 'painel_pagamentos.html', {'hoje': hoje,
                                                         'total': total,
                                                         'data_hoje': data_hoje,
                                                         'visuald': visualg,
                                                         'pagamento_listagem': pagamento_listagem})


def login_admin(request):
    try:
        if 'gerentelog' in request.session:
            return HttpResponseRedirect('/paineladm')
    except paineladm:
        pass
    datahora = data_corrente()
    return render(request, 'painel_admlogin.html', {'titulo': titulo,
                                                 'ncss': ncss,
                                                 'datahora': datahora,
                                                 'visuald': visualg,
                                                 'initial_scale': initial_scale,})


def logar_admin(request):
    try:
        if 'gerentelog' in request.session:
            if len(coleta) > 0:
                webpage.append(
                    [f"{request.session['gerentelog']} {request.session['pagina']} "])
            else:
                coleta.append([request.session['gerentelog'],
                               request.session.set_expiry(0)])
                webpage.append(
                    [f"{request.session['gerentelog']} {request.session['pagina']} "])
        if 'gerentelog' in request.session:
            return HttpResponseRedirect('/paineladm')

        if request.POST:

            userdb = Colaborador.objects.get(login=request.POST['usuario'])
            clienteid = str(request.POST['usuario']).lower()
            
   
            
            if userdb.passweb == cripto(request.POST['usuario'], request.POST['password']):
                if userdb.status == 0:
                    userdb.status = 1
                    userdb.save()
                    request.session['gerentelog'] = userdb.login
                    request.session.set_expiry(0)

                else:
                    userdb = Colaborador.objects.get(login=request.POST['usuario'])
                    userdb.status = 0
                    userdb.save()
                    return HttpResponseRedirect('/')
            return HttpResponseRedirect('/')
        
        return HttpResponseRedirect('/')
    except Colaborador.DoesNotExist:
        return HttpResponseRedirect('/')

def sairadm(request):
    
    try:
        userdb = Colaborador.objects.get(login=request.session['gerentelog'])
        userdb.status = 0
        userdb.save()
        del request.session['gerentelog']
        
       
    except KeyError:
        pass
    return HttpResponseRedirect('/')

