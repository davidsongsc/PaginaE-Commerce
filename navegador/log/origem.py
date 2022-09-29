from os import listdir
from os.path import isfile, join
path = './bmiud/perfil/mente'
arquivos = [f for f in listdir(path) if isfile(join(path, f))]
'''
        r   leitura apenas
        w   escritura
        r+  leitura escrita
        a   acrescenta
'''

valores_personalidade = ['INTJ', 'ENTJ', 'INTP', 'ENTP',
                         'INFJ', 'ENFJ', 'INFP', 'ENFP',
                         'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
                         'ISTP', 'ISFP', 'ESTP', 'ESFP', ]

valores_saudacao = ['ola!', 'oi', 'Ok', 'Eai ']
#valores_fala = ['é tu', 'eu nao', 'que que isso']
valores_linha = [
                    'observar',
                    'agir',
                    'analisar',
                    'reiniciar'

]

valores_teste = [['pedro', 'esquerda', 'sociopata'], ['thiago', 'direita']]

def listas_cmescritura(biblioteca, titulo):
    with open(titulo, 'w') as memoria:
        for valor in range(len(biblioteca)):
            memoria.write(f'{biblioteca[valor]}\n')


def listas_cmleitura(titulo):
    leitura = []
    with open(titulo, 'r') as lembranca:
        for valor in lembranca:
            leitura.append(valor)
        return leitura


def auto_reset():


    listas_cmescritura(valores_saudacao, "saudacao.agir")
    listas_cmescritura(valores_linha, "basico.pense")
    listas_cmescritura(valores_personalidade, "personalidade.pessoa")
    listas_cmescritura(valores_teste, "teste.teste")





#Funcao responsavel por ouvir e reconhecer a fala



if __name__ == '__main__':
    print(__name__)
    auto_reset()
    




