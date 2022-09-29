from .models import Comanda, Pedido
from .nome_produto import *
def pagamento_verificar():
    print()
def valor_carrinho(request):
    try:
            
        pedidos = Pedido.objects.filter(cliente=request.session['nickapelido'])
        if not 'idpedido' in request.session:
                d = Pedido(
                    cliente=request.session['nickapelido'], status=1)
                d.save()
                historico_pedido = Pedido.objects.filter(
                    cliente=request.session['nickapelido'])
                for m in historico_pedido:
                    if m.status < 14:
                        request.session['idpedido'] = m.idpedido
        if len(pedidos) <= 0:
            b = Pedido(cliente=request.session['nickapelido'], status=1)
            b.save()
            pedidos = Pedido.objects.filter(cliente=request.session['nickapelido'])
        
            

        if len(pedidos) >= 0:
            localizador_pedido = len(pedidos)-1

        else:
            localizador_pedido= 0
        lcomanda = Comanda.objects.filter(comanda=pedidos[localizador_pedido].idpedido)
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
            vtaxa = vconsumo*0.04

        # variaveis dos totais
        
        vt = (vconsumo-vdesconto)+vtaxa
        vtotal = '%.2f' % vt
        vconsumo = '%.2f' % vconsumo
        return [vtotal, vconsumo, vtaxa]
    except AssertionError:
        if not 'idpedido' in request.session:
            d = Pedido(
                cliente=request.session['nickapelido'],  status=1)
            d.save()
            historico_pedido = Pedido.objects.filter(
                cliente=request.session['nickapelido'])
            for m in historico_pedido:
                if m.status < 14:
                    request.session['idpedido'] = m.idpedido
                    
        
