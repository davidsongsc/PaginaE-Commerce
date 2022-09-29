from ipware import get_client_ip
from .adm.horarios import dahora
from .neurino import cmd

#  Metodo de gravação de logs por usuario
def session_log(request, paginaweb):
    "Esta função identifica a ação do usuario na navegação do site."
    ip, is_routable = get_client_ip(request)
    info = []
    # Se não for identificado um IP, o servidor atribuirar 0.0.0.0
    # Para o usuario
    if ip is None:
        info.append('0.0.0.0')
    else:
        info.append(ip)
        # Caso o endereço IP do usuario seja inicialmente semelhantes a rede interna
        # O servidor marcará (rede interna), caso contrário (rede externa).
        if is_routable:
            info.append('rede externa')
        else:
            info.append('rede interna')
        # Coleta os dados da seção
    coleta = []         
    request.session['pagina'] = paginaweb[0]
        # Se o nome da pagina for Maior que 2...
    if len(paginaweb) >= 2:
        # Gravação do log navegação.
        coleta.append([request.session['nickapelido'],
                       request.session.get_expire_at_browser_close(),
                       dahora(), request.session['pagina'],
                       paginaweb[1],
                       paginaweb[2].idprodutos,
                       paginaweb[2].disponibilidade,
                       info, ])

        cmd.escritura(coleta, request.session['nickapelido'])
        # Se ouver um cliente identificado...
    if 'nickapelido' in request.session:
        # Gravação do log, usuario.
        coleta.append([request.session['nickapelido'],
                       request.session.get_expire_at_browser_close(),
                       dahora(), request.session['pagina'],
                       info])
        cmd.escritura(coleta, request.session['nickapelido'])

