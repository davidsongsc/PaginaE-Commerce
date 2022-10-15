# Importing the modules.
from urllib import request
from ..var import *
from django.shortcuts import render
from ..produtos import *
from ..carrinho_contas import *
from ..gestor.programs import visuald, visualg
from ..adm.cardapio.grupo1 import grupo_variavel, secao, void_grupos, grupo_constante
link = t_grupos()[0]
lista_produtos = []
listagemg = []
ab = []
ac = []

# Creating a list of lists.
for xx in void_grupos:
    listagemg.append([xx.nome_grupo, xx.id_grupo])

for xa in listagemg:
    ab.append(xa[0])
    ac.append([xa[0],xa[1]])

    """
    It takes a question from the user, and returns the answer from the bot.
    
    :param request: The request object is an HttpRequest object. It contains metadata about the request
    :param pergunte: The question that the user will ask the bot
    :return: A list of dictionaries.
    """
def bot(request, pergunte):
    j = pizzabot.presposta(pergunte)
    return render(request, 'chat/bot.html', {'j': j,
                                             })

def room(request, room_name):
    return render(request, 'chat/room.html', {
        'room_name': room_name
    })

def cardapio_principal(request):
    # Rendering the template 'novo_cardapio_principal.html'
    titulo_web = 'principal'
    #print(request.session)
    if 'nickapelido' in request.session:
        usuario = request.session['nickapelido']
        
        valor_parcial = valor_carrinho(request)
        return render(request, 'novo_cardapio_principal_login.html', {'titulo': titulo,
                                             'usuario': usuario,
                                             'valor_parcial': valor_parcial,
                                             'ncss': ncss,
                                             'visuald': visuald,
                                             'initial_scale': initial_scale,
                                             'link': link,
                                             'titulo_web': titulo_web,
                                             })
    elif 'gerentelog' in request.session:
            usuario = request.session['gerentelog']
            valor_parcial = 0.0
            return render(request, 'novo_cardapio_principal_logingm.html', {'titulo': titulo,
                                             'usuario': usuario,
                                             'valor_parcial': valor_parcial,
                                             'ncss': ncss,
                                             'visuald': visualg,
                                             'initial_scale': initial_scale,
                                             'link': link,
                                             'titulo_web': titulo_web,
                                                    })    
    else:
        usuario = 'Fulano'
        valor_parcial = 0.00
        return render(request, 'novo_cardapio_principal.html', {'titulo': titulo,
                                                'usuario': usuario,
                                                'valor_parcial': valor_parcial,
                                                'initial_scale': initial_scale,
                                                'ncss': ncss,
                                                'link': link,
                                                'titulo_web': titulo_web,
                                                'visuald': visuald,
                                                })

def cozinha(request, modelo):
    # Rendering the template 'novo_cardapio_principal.html'
    titulo_web = modelo
    print(modelo)
    if 'nickapelido' in request.session:
        usuario = request.session['nickapelido']
        valor_parcial = valor_carrinho(request)
        return render(request, 'janela.html', {'titulo': titulo,
                                             'usuario': usuario,
                                             'modelo': modelo,
                                             'valor_parcial': valor_parcial,
                                             'ncss': ncss,
                                             'visuald': visuald,
                                             'initial_scale': initial_scale,
                                             'link': link,
                                             'titulo_web': titulo_web,
                                             })
    elif 'gerentelog' in request.session:
            usuario = request.session['gerentelog']
            valor_parcial = 0.0
            return render(request, 'janela.html', {'titulo': titulo,
                                             'usuario': usuario,
                                             'modelo': modelo,
                                             'valor_parcial': valor_parcial,
                                             'ncss': ncss,
                                             'visuald': visualg,
                                             'initial_scale': initial_scale,
                                             'link': link,
                                             'titulo_web': titulo_web,
                                                    })    
    else:
        usuario = 'Fulano'
        valor_parcial = 0.00
        return render(request, 'janela.html', {'titulo': titulo,
                                                'usuario': usuario,
                                                'modelo': modelo,
                                                'valor_parcial': valor_parcial,
                                                'initial_scale': initial_scale,
                                                'ncss': ncss,
                                                'link': link,
                                                'titulo_web': titulo_web,
                                                'visuald': visuald,
                                                })
def grupo_pesquisa(request, grupo_id:str):
    if grupo_id in ab:
        titulo_web = grupo_id
        print(ac[0][0])
        counter = ab.index(titulo_web)+1
        
        print(counter)
        itens = produto_cardapio_menu(counter)
        if 'nickapelido' in request.session:
            usuario = request.session['nickapelido']
            valor_parcial = valor_carrinho(request)
            return render(request, 'novo_cardapio_produtos_login.html', {'titulo': titulo,
                                                    'usuario': usuario,
                                                    'valor_parcial': valor_parcial,
                                                    'initial_scale': initial_scale,
                                                    'ncss': ncss,
                                                    'visuald': visuald,
                                                    'itens': itens,
                                                    'titulo_web': titulo_web,
                                                    })
        elif 'gerentelog' in request.session:
            usuario = request.session['gerentelog']
            valor_parcial = 0.0
            return render(request, 'novo_cardapio_produtos_logingm.html', {'titulo': titulo,
                                                    'usuario': usuario,
                                                    'valor_parcial': valor_parcial,
                                                    'initial_scale': initial_scale,
                                                    'ncss': ncss,
                                                    'visuald': visualg,
                                                    'itens': itens,
                                                    'titulo_web': titulo_web,
                                                    })

        else:
            usuario = 'Fulano'
            valor_parcial = 0.00
            return render(request, 'novo_cardapio_produtos.html', {'titulo': titulo,
                                                    'usuario': usuario,
                                                    'initial_scale': initial_scale,
                                                    'valor_parcial': valor_parcial,
                                                    'ncss': ncss,
                                                    'visuald': visuald,
                                                    'itens': itens,
                                                    'titulo_web': titulo_web,
                                                    })

def cardapio_produtos(request, produto_id:str):
    
    titulo_web = f'{produto_id}'
    
    produto = produto_pesquisa(produto_id)
    if 'nickapelido' in request.session:
        usuario = request.session['nickapelido']
        valor_parcial = valor_carrinho(request)
        return render(request, 'novo_cardapio_produtos_detalhado_login.html', {'titulo': titulo,
                                                'usuario': usuario,
                                                'valor_parcial': valor_parcial,
                                                'initial_scale': initial_scale,
                                                'ncss': ncss,
                                                'produto': produto,
                                                'titulo_web': titulo_web,
                                                'visuald': visuald,
                                                }) 
    else:
        usuario = "Fulano"
        valor_parcial = 0.00
        return render(request, 'novo_cardapio_produtos_detalhado.html', {'titulo': titulo,
                                                'usuario': usuario,
                                                'valor_parcial': valor_parcial,
                                                'initial_scale': initial_scale,
                                                'ncss': ncss,
                                                'produto': produto,
                                                'titulo_web': titulo_web,
                                                'visuald': visuald,
                                                })                                                                                                                                                                                                                                                                                                  

def pedido_detalhes(request, produto_id):
     
    titulo_web = f'{produto_id}'

    produto = produto_pesquisa(produto_id)

    pontoc = [['M', 'MAL PASSADO'],
              ['PM', 'PONTO MAL'],
              ['P', 'AO PONTO'],
              ['PB', 'PONTO BEM'],
              ['B', 'BEM PASSADO'],]

    temperot = [['NORMAL T', 'TEMPERO TRADICIONAL'],
                ['ERVAS T', 'TEMPERO DE ERVAS FINAS'],
                ['SO NO SAL', 'SO NO SAL'],
                ['SEM TEMPERO', 'SEM TEMPERO'],
                ]
    massas = [['AEO', 'ALHO E OLEO'],
            ['M BRANCO', 'MOLHO FREDERICO'],
            ['M CREME', 'MOLHO CREME'],
            ['M VERMELHO', 'MOLHO VERMELHO'],
            ['M BENDE', 'MOLHO BENDEITO']]
    burguersr = [
        ['NORMAL', 'NORMAL'],
        ['P C Q', 'PAO CARNE QUEIJO'],
        ['P   C', 'PÃO E CARNE'],
    ]
    burguersm = [
        ['mostarda', 'mostarda'],
        ['ketchup', 'ketchup'],
        ['maionese', 'maionese'],
        ['cheddar', 'cheddar'],
        ['flaming', 'flaming'],
        ['maionil', 'maionese especial'],
        ['barbecue', 'barbecue'],
    ]
    burguersc = [
        ['NORMAL', 'COMPLETO',],
        ['S CEBOLA', 'SEM CEBOLA',],
        ['S TOMATE', 'SEM TOMATE',],
        ['S ALFACE', 'SEM ALFACE',],
        ['S PICLES', 'SEM PICLES',],
        ['S MANJER', 'SEM MANJERICÃO',],
        ['NORMAL', 'COMPLETO',],
        ['C CEBOLA', 'COM CEBOLA',],
        ['C TOMATE', 'COM TOMATE',],
        ['C ALFACE', 'COM ALFACE',],
        ['C PICLES', 'COM PICLES',],
        ['C MANJER', 'COM MANJERICÃO',],
    ]

    massasc = [
        ['penne', 'penne'],
        ['rigatoni', 'rigatoni'],
        ['gravata', 'gravata'],
        ['caracol', 'caracol'],
        ['rigatoni', 'rigatoni'],
    ]

    massasl = [
        ['fettuccine', 'fettuccine'],
        ['espaguete', 'espaguete'],
        ['bavette', 'bavette'],
    ]
    
    farofa =  [['farofa L', 'farofa LINGUIÇA'],
             ['farofa Bcon', 'farofa BACON'],
             ['farofa C', 'farofa COGUMELOS'],
             ['farofa banana', 'farofa banana'],
             ['farofa ca', 'farofa cebola alecrim'],
             ['farofa O', 'farofa Ovo'],]

    return render(request, 'novo_detalhes_pedido.html', {'titulo': titulo,
                                            'pontoc': pontoc,
                                            'massas': massas,
                                            'burguersm': burguersm,
                                            'burguersc': burguersc,
                                            'burguersr': burguersr,
                                            'temperot': temperot,
                                            'initial_scale': initial_scale,
                                            'ncss': ncss,
                                            'produto': produto,
                                            'titulo_web': titulo_web,
                                            'visuald': visuald,
                                            })                                                                                                                                                                                                                                                                                                  

