from datetime import datetime, date

def data_hora_imports():
    '''
    Retorna os valores,
    Data Hora (MM\DD\AAAA - HH:MM:SS)
    Data (DD\MM\AAAA)
    
    Os valores estão armazenados em listas!
    '''
    return datetime, date

def dahora():
    "Retorna data e hora."
    return f'{data_hora_imports()[1].today().strftime("%Y-%m-%d")} {data_hora_imports()[0].now().strftime("%H:%M:%S")}'

def data_corrente():
    "Retorna data no modelo do banco de dados yyyy-mm-dd."
    return f'{data_hora_imports()[1].today().strftime("%Y-%m-%d")}'