from os import listdir, mkdir
from os.path import isfile, join, isdir, abspath, dirname
from datetime import date
from random import randint
resident = f'{abspath(dirname(__file__))}'
path = resident
"arquivos = [f for f in listdir(path) if isdir(join(path, f))]"

def arquivo_naocontrado(biblioteca, titulo):
    with open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'w') as b:
        b.close()
    b = open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'r')
    c = b.readlines()

    for valor in range(len(biblioteca)):
        c.append(f'[{biblioteca[valor]}]\n')
        
    b = open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'w')
    b.writelines(c)
    b.close()

def criar_arquivo(biblioteca, titulo):
    b = open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'r')
    c = b.readlines()
    for valor in range(len(biblioteca)):
        c.append(f'[{biblioteca[valor]}]\n')
        #memoria.write(f'[{biblioteca[valor]}]\n')
    b = open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'w')
    b.writelines(c)
    b.close()

def criar_pasta(biblioteca, titulo):
    mkdir(f'{resident}/{titulo}')
    path = f'{resident}{titulo}/'
    arquivos = [f for f in listdir(path) if isfile(join(path, f))]
    if f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log' in arquivos:
        with open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'w') as m:
            b.close()
    
    m = open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'r')
    c = m.readlines()

    for valor in range(len(biblioteca)):
        c.append(f'[{biblioteca[valor]}]\n')
        #memoria.write(f'[{biblioteca[valor]}]\n')
    m = open(f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log', 'w')
    m.writelines(c)
    m.close()

def leitura(titulo):
    leitura = []
    path = resident
    pastas = [f for f in listdir(path) if isdir(join(path, f))]
    if titulo in pastas:
        path = f'{resident}{titulo}/'
        arquivos = [f for f in listdir(path) if isfile(join(path, f))]
        if arquivos.__contains__(f'{date.today().strftime("%Y-%m-%d")}.log'):
            
            with open(f'{resident}/{titulo}/{date.today().strftime("%Y-%m-%d")}.log', 'r') as memoria:
                
                for valor in memoria:
                    leitura.append(valor)
                memoria.close()               
                #return listar(leitura)
                return memoria.readlines()

def escritura(biblioteca, titulo):
    path = resident
    pastas = [f for f in listdir(path) if isdir(join(path, f))]
    
    if titulo in pastas:
        path = f'{resident}/{titulo}/'
        arquivos = [f for f in listdir(path) if isfile(join(path, f))]
        
        try:
            if not f'{resident}/{titulo}/{titulo} {date.today().strftime("%Y-%m-%d")}.log' in arquivos:
                criar_arquivo(biblioteca, titulo)

        except FileNotFoundError:
            arquivo_naocontrado(biblioteca, titulo)
    else:
        try:
           criar_pasta(biblioteca, titulo)
        except FileNotFoundError:
            arquivo_naocontrado(biblioteca, titulo)



def listar(itens_lista):
    listaA = []
    palavra = ''
    contador_itens = 1
    for xvalor in range(0, len(itens_lista)):
        if itens_lista[xvalor] != "[" and itens_lista[xvalor] != "'" and itens_lista[xvalor] != ',' and itens_lista[xvalor] != ']':
            palavra += str(f'{itens_lista[xvalor]}')

        if itens_lista[xvalor] == ',':
            contador_itens += 1

    item = ''


    for i in palavra:
        item += i
        if i == ' ':
            listaA.append(item)
            contador_itens -= 1
            item = ''

    if contador_itens == 1:
        listaA.append(item)


    return listaA

class Ler:
    def autores(self):
        return leitura('autores.txt')

    def personalidade(self):
        return leitura('personalidade.pe')

    def publicacao(self):
        return leitura('pub')

    def teste(self):
        return leitura('teste.teste')



def acao(lista):
    return lista[randint(0, len(lista) - 1)]

