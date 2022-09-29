import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer
import speech_recognition as sr
from chatterbot import ChatBot, chatterbot
from chatterbot.trainers import ListTrainer

class JulianoBot:
    def __init__(self) -> None:
        self.indeciso = ['Ola boa noite, me chamo Djayh, sou atendente virtual...\nja sabe o que deseja?',
                'não sei ainda.',
                'quer uma ajudinha para escolher?',
                'sim',
                'vou te mostrar o nosso cardapio ok?',
                'ok',
                'então, conseguiu escolher?',
                'ainda não.',
                'conhece as nossas promoções?',
                'não',
                'ok, vou mostrar algumas, pode ser?',
                'pode',
                'alguma promoção te agradou?',
                'sim, de duas pizzas',
                'deseja alguma bebida?',
                'sim',
                'qual bebida deseja?',
                'coca',
                'ok, então ficou uma promoção de duas pizzas e uma coca cola 2L, certo?',
                'isso ai',
                'você ja tem cadastro?',
                'tenho',
                'diga seu numero, por favor?',
                '21983108439',
                'davidson?',
                'isso!',
                'pode confirmar seus 3 primeiros numeros do cpf?',
                '140',
                'identidade parcialmente confirmada. Pedido encaminhado.',
                'ok',
                'Assim que estiver pronto, enviaremos para você!',
                
                ]


        self.chatbot = ChatBot(
            'Juliano',
            storage_adapter='chatterbot.storage.SQLStorageAdapter',
            logic_adapters=[
                {
                    'import_path': 'chatterbot.logic.BestMatch'
                },
                {
                    'import_path': 'chatterbot.logic.SpecificResponseAdapter',
                    'input_text': 'lista pizzas',
                    'output_text': 'Ok, here is a link: http://chatterbot.rtfd.org'
                }
                ,
                {
                    'import_path': 'chatterbot.logic.SpecificResponseAdapter',
                    'input_text': 'quero um cadastro',
                    'output_text': 'Ok, here is a link: http://chatterbot.rtfd.org'
                }
            ]
        )

        self.trainer = ListTrainer(self.chatbot)
        self.trainer.train(self.indeciso)

    def presposta(self, perguntaString:str):
        return str(self.chatbot.get_response(perguntaString))
    
    f = False  


class ChatConsumer(WebsocketConsumer):
    def connect(self):
        self.sala_nome = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = f'chat_{self.sala_nome}'

        # Join room group
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )

        self.accept()

    def disconnect(self, close_code):
        # Leave room group
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )

    # Receive message from WebSocket
    def receive(self, text_data):
        j = JulianoBot()
        text_data_json = json.loads(text_data)
        message = text_data_json['message']

        # Send message to room group
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )
        rep_ju = j.presposta(str(message))
        __resposta_robo = '{"message": "%s"}' % rep_ju
        btext_data_json = json.loads(__resposta_robo)
        message = btext_data_json['message']
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )
     
        print(f'Cliente: {message}')
        print(f'Robo: {rep_ju}')
    # Receive message from room group
    def chat_message(self, event):
        message = event['message']

        # Send message to WebSocket
        self.send(text_data=json.dumps({
            'message': message,
            
        }))
