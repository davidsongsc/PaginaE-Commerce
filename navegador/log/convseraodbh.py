def binario_para_decimal(valorBinario: str):
    "Retorna o valorBinario convertido para decimal"
    if valorBinario.isalnum():
        numeracao = []
        for binario in valorBinario:
            numeracao.append(binario)

        representacao = []
        base: int
        numeracao.reverse()
        for x in range(numeracao.__len__()):
            if numeracao[x] == "1":
                base = 2 ** x
                representacao.append(base)

        resultado = 0
        for b in representacao:
            resultado += b
        return resultado

print(binario_para_decimal("00100111"))
