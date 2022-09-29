import nltk

#nltk.download()

texto = "Ola Paula, bom dia."

frases = nltk.tokenize.sent_tokenize(texto)
print(frases)

tokens = nltk.word_tokenize(texto)
print(tokens)

classes = nltk.pos_tag(tokens)
print(classes)