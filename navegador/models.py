from django.db import models


class Colaborador(models.Model):
    login = models.CharField(primary_key=True,max_length=12, blank=False, null=False)
    passweb = models.CharField(max_length=17, blank=False, null=False)
    pessoa = models.IntegerField()
    funcao = models.IntegerField()
    sbase  = models.FloatField()
    status = models.IntegerField()
    dias_escala = models.IntegerField()
    horas_escala  = models.FloatField()
    class Meta:
        managed = False
        db_table = 'colaborador'
    def __str__(self):
        return self.login

class Pagamentos(models.Model):
    primaria = models.IntegerField(primary_key=True)
    pedido = models.IntegerField()
    valorpago = models.IntegerField()
    bandeira = models.CharField(max_length=29, blank=False, null=False)
    registro = models.DateTimeField(blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'pagamentos'
    def __str__(self):
        return self.primaria
        
class Produtos(models.Model):
    idprodutos = models.AutoField(primary_key=True)
    nomeoriginal = models.CharField(unique=True, max_length=12, blank=True, null=True)
    nomefantasia = models.CharField(unique=True, max_length=18, blank=True, null=True)
    valororiginal = models.FloatField(blank=True, null=True)
    tipo = models.IntegerField(blank=True, null=True)
    disponibilidade = models.IntegerField(blank=True, null=True)
    federal = models.FloatField(blank=True, null=True)
    estadual = models.FloatField(blank=True, null=True)
    icms = models.FloatField(blank=True, null=True)
    confins = models.FloatField(blank=True, null=True)
    bonus = models.FloatField(blank=True, null=True)
    auxinvst = models.FloatField(blank=True, null=True)
    reserva = models.FloatField(blank=True, null=True)
    regional = models.FloatField(blank=True, null=True)
    valorreal = models.IntegerField(blank=True, null=True)
    descr = models.TextField(blank=True, null=True)
    alergia = models.CharField(max_length=100, blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'produtos'
    def __str__(self):
        return f'{self.nomefantasia} (disponibilidade: {self.disponibilidade})'

class Usuario(models.Model):
    usuario = models.CharField(primary_key=True,max_length=32, blank=False, null=False)
    senha = models.CharField(max_length=32, blank=False, null=False)
    dataregistro = models.DateTimeField(blank=True, null=True)
    ultimo_login = models.DateTimeField(blank=True, null=True)
    ultimo_logoff = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField()
    class Meta:
        managed = False
        db_table = 'usuario'
    def __str__(self):
        return self.usuario

class Grupo(models.Model):
    id_grupo = models.AutoField(primary_key=True)
    nome_grupo = models.CharField(max_length=45, blank=True, null=True)
    descr = models.CharField(max_length=255, blank=True, null=True)
    visivel = models.IntegerField()
    link = models.CharField(max_length=45, blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'grupo'
    def __str__(self):
        return self.nome_grupo


class Pedido(models.Model):
    idpedido = models.AutoField(primary_key=True)
    cliente = models.CharField(max_length=32, blank=False, null=True)
    colaborador = models.CharField(max_length=12, blank=False, null=True)
    datahora = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField()
    class Meta:
        managed = False
        db_table = 'pedido'
    def __str__(self):
        return f'{self.idpedido} {self.cliente}'

class Comanda(models.Model):
    idp = models.AutoField(primary_key=True)
    comanda = models.IntegerField()
    produto = models.IntegerField()
    qtd = models.IntegerField()
    vendedor = models.CharField(max_length=12, blank=False, null=True)
    status = models.IntegerField()
    janela = models.IntegerField()
    registro = models.DateTimeField()
    valorund = models.FloatField()
    
    class Meta:
        managed = False
        db_table = 'comanda'
    def __str__(self):
        return f'{self.idp} {self.comanda}'

class Tema(models.Model):
    id = models.AutoField(primary_key=True)
    nome_empresa = models.CharField(max_length=45, blank=False, null=True)
    nome_fantasia = models.CharField(max_length=245, blank=False, null=True)
    cnpj = models.CharField(max_length=14, blank=False, null=True)
    inicio_registro = models.DateField()
    fim_registro = models.DateField()
    keycpf_responsavel = models.CharField(max_length=32, blank=False, null=True)
    maquinas = models.IntegerField()
    chave_registro = models.CharField(max_length=245, blank=False, null=True)
    tema = models.IntegerField()
    ender = models.CharField(max_length=255, blank=False, null=True)
    complemento = models.CharField(max_length=255, blank=False, null=True)
    complemento2 = models.CharField(max_length=115, blank=False, null=True)
    telefone1 = models.CharField(max_length=15, blank=False, null=True)
    telefone2 = models.CharField(max_length=15, blank=False, null=True)
    class Meta:
        managed = False
        db_table = 'tema'
    def __str__(self):
        return f'{self.cnpj} {self.nome_fantasia}'

class Relatorio_e_s_p(models.Model):
    id = models.AutoField(primary_key=True)
    datahora = models.DateTimeField()
    cliente = models.CharField(max_length=32, blank=False, null=True)
    vendedor = models.CharField(max_length=12, blank=False, null=True)
    produto = models.IntegerField()
    comanda = models.IntegerField()
    pedido = models.IntegerField()
    disp_anterior = models.IntegerField()
    disp_atual = models.IntegerField()
    obs = models.CharField(max_length=45, blank=False, null=True)
    
    class Meta:
        managed = False
        db_table = 'relatorio_e_s_p'
    def __str__(self):
        return f'{self.id} {self.datahora} {self.cliente}'