from .horarios import data_hora_imports, dahora
from ..promolist import promo, inicio_happy, fim_happy

def calcular_promo(valor, desconto):
    f'''
    Retorna o valor com desconto.
        Ex:
            v == valor
            d == desconto
            p == porcentagem
            * == multiplica
            / == divide
            - == subtrai

        ({{v}} - ({{v}} / {{p}} * {{d}}))
        
    '''
    return float('%.2f' % (valor - (valor / 100 * desconto)))


def somar(valor, porcentagem):
    f'''
    Retorna o valor com acrescimo.
        Ex:
            v == valor
            p == porcentagem
            * == multiplica
            / == divide
            + == soma

        ({{v}} + ({{v}} * {{p}} / {{100}}))
    '''
    return float('%.2f' % (valor + (valor * porcentagem / 100)))

def dia_semana():
    data = data_hora_imports()[1].today().strftime("%Y-%m-%d")
    return data_hora_imports()[1](year=int(f'{data[0]}{data[1]}{data[2]}{data[3]}'), month=int(f'{data[5]}{data[6]}'), day=int(f'{data[8]}{data[9]}')).weekday()



def promos():
    dthr = data_hora_imports()[0].now().strftime("%H:%M:%S")
    lista_promocao = []
    
    
    
    # evento happy-hour
    if dia_semana() != 5 and dia_semana() != 6:
        if int(f'{dthr[0]}{dthr[1]}') >= 17 and int(f'{dthr[0]}{dthr[1]}') < 20:
            lista_promocao.append('happy-hour')
            lista_promocao.append(50)

    # evento almoço
    if dia_semana() != 5 and dia_semana() != 6:
        if int(f'{dthr[0]}{dthr[1]}') >= 11 and int(f'{dthr[0]}{dthr[1]}') < 16:
            lista_promocao.append('almoço')
            lista_promocao.append(30)

    # evento boom lançamento
    if dia_semana() != 5 and dia_semana() != 6:
        if int(f'{dthr[0]}{dthr[1]}') >= 10 and int(f'{dthr[0]}{dthr[1]}') < 21:
            lista_promocao.append('boom')
            lista_promocao.append(15)

    if dia_semana() == 6: # DOMINGO
        #lista_promocao.append('domingo')
        #lista_promocao.append(25)
        pass
    if dia_semana() == 5: # SABADO
        #lista_promocao.append('sabado')
        #lista_promocao.append(12)
        pass
    if dia_semana() == 4: # SEXTA-FEIRA
        #lista_promocao.append('sexta')
        #lista_promocao.append(15.5)
        pass
    if dia_semana() == 3: # QUINTA-FEIRA
        #lista_promocao.append('quinta')
        #lista_promocao.append(15.5)
        pass
    if dia_semana() == 2: # QUARTA-FEIRA
        #lista_promocao.append('quarta')
        #lista_promocao.append(15.5)
        pass
    if dia_semana() == 1: # TERÇA-FEIRA
        #lista_promocao.append('terca')
        #lista_promocao.append(10.5)
        pass
    if dia_semana() == 0: # SEGUNDA-FEIRA
        #lista_promocao.append('segunda')
        #lista_promocao.append(10.5)
        pass
    for j in promo:
        lista_promocao.append(j)
    return lista_promocao