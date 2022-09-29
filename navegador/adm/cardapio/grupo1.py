from ...models import Produtos, Grupo
from ...adm.calculos import promos, calcular_promo, somar
void_grupos = []
grupo_variavel = len(Grupo.objects.all())
grupo_constante = len(Grupo.objects.all())
for nomes_g in Grupo.objects.all():
    void_grupos.append(nomes_g)
grupo_nomes = void_grupos
secao = []

for x in range(1, grupo_variavel):
    produtos_listados = Produtos.objects.filter(tipo=x)
    grupo_produtos_listados = []
    for n in produtos_listados:
        if n.disponibilidade > 0:
            destaque = []
            alerta = []
            d = 0

            for x in range(0, len(promos()), 2):
                if promos()[x] in promos():
                    a = promos()[(promos().index(promos()[x])+1)]
                    if str(n.alergia).__contains__(promos()[x]):
                        d = a
                        if str(n.alergia).__contains__('happy-hour'):
                            destaque.append('happy-hour')
            if str(n.alergia).__contains__('almoço'):
                destaque.append('almoço')

            if str(n.alergia).__contains__('açucar'):
                alerta.append('suggar')
            if str(n.alergia).__contains__('vegan'):
                alerta.append('veganf')
            if str(n.alergia).__contains__('gluten'):
                alerta.append('glutenf')
            if str(n.alergia).__contains__('leite'):
                alerta.append('lactosef')
            if str(n.alergia).__contains__('pimenta'):
                alerta.append('pimentaf')
            if str(n.alergia).__contains__('pr1'):
                destaque.append('evento-a')
            if str(n.alergia).__contains__('pr2'):
                destaque.append('evento-b')
            if str(n.alergia).__contains__('pr3'):
                destaque.append('evento-c')
            if str(n.alergia).__contains__('pr4'):
                destaque.append('evento-d')
            if str(n.alergia).__contains__('pr5'):
                destaque.append('evento-f')
            if str(n.alergia).__contains__('pr6'):
                destaque.append('evento-x')
            if str(n.alergia).__contains__('bkbon'):
                destaque.append('bkbon')
            mtvalor = n.federal + n.estadual + n.icms + n.confins + \
                n.bonus + n.auxinvst + n.reserva + n.regional
            grupo_produtos_listados.append([n.idprodutos, n.nomeoriginal, n.nomefantasia,
                            calcular_promo(somar(n.valororiginal, mtvalor), d), n.descr, alerta, destaque, n.tipo])
        secao.append(grupo_produtos_listados)

