import socket
try:
    ssip = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    ssip.connect(("8.8.8.8", 80))
    lip = f'{ssip.getsockname()[0]}'
except OSError:
    print('Internet não conectada!')
    lip = '127.0.0.1'