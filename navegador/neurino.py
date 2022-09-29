from .log import geradorlog as cmd
from os import listdir, path, sep
from os.path import isfile, join
from random import randint


print()
path = f'{path.abspath(path.dirname(__file__))}/log'
arquivos = [f for f in listdir(path) if isfile(join(path, f))]

#site = [[f for f in cmd.leitura('autores.txt')],
#           [f for f in cmd.leitura('pub.tx')]]
