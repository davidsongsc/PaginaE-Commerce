from .pix import Pix
import qrcode 

# Metodo gerador do qrcode para o pix.
def pagamento_qrcode_pix(cliente:str, valorpedido:float, identificador:int, data:str):
    pix = Pix()
    pix.set_pixkey('14021469737')
    pix.set_description(f'pagamento pedido rj{identificador}zn')
    pix.set_amount(valorpedido)
    pix.set_merchant_name('Davidson George')
    pix.set_merchant_city('Rio de janeiro')
    pix.set_txid(f'LJRJ{identificador}ZN')
    img = qrcode.make(f'{pix}')
    img.save(f"navegador/static/img/qrpix/{data}_{cliente}_{identificador}.png")
    return pix

# Metodo salva imagem gerada pelo pix 'data_usuario_pedido.png'
def pagamento_pix(usuario, valor_total, idpedido, data):
    chavepix_pix = pagamento_qrcode_pix(usuario, valor_total, idpedido, data)
    qrcode_pix = f"static\img\qrpix\{data}_{usuario}_{idpedido}.png"
    qrcode_titulo = f"{usuario}_{idpedido}"
    return [chavepix_pix, qrcode_pix, qrcode_titulo]