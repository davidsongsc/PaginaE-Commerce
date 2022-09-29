from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer
from chatterbot.trainers import ListTrainer


bot = ChatBot(
    'Norman',
    
    database_uri='sqlite:///normam.sqlite3'
)

# Treino baseado no corpus em português
pizza = ['Ola boa noite, ja sabe o que deseja?',
         'sim, quero uma pizza de calabresa',
         'uma pizza de calabresa, OK. Alguma bebida?',
         'uma coca zero',
         'você ja tem cadastro?',
         'sim',
         'pode me informar seu numero?']

trainer = ListTrainer(bot)
trainer.train(pizza)
f = False
#ouvir_microfone()
print('Pedro: Ola, Sou atendente online da BurguerChava. Gostaria de fazer algum pedido?')
while f != True:
    pergunta = input('Cliente: ')
    resposta = bot.get_response(pergunta)
    print('Pedro: ', resposta)
    if pergunta == '!desligar' or resposta == '!desligar':
        f = True
        break