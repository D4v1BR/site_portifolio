while True:
    print("Seja bem-vindo ao Atacado de Ressaca de Davi Béber Ribeiro.")
    print("Empresa dedicada a venda de marcas de cervejas para restaurantes e bares menores.")
    print("Aqui está a lista de cervejas disponíveis:")
    print("| Numeração |         Cerveja       |   Valor por unidade  |")
    print("-"*60)
    print("|     1     |   Spaten (350ml)      |        R$3,89        |")
    print("|     2     |   Stella (600ml)      |        R$9,49        |")
    print("|     3     |   Bohemia (350ml)     |        R$3,99        |")
    print("|     4     |   Eisenbahn (600ml)   |        R$6,49        |")
    print("|     5     |   Heineken (600ml)    |        R$9,18        |")


    cerveja={
    1: ["Spaten (350ml)", 3.89],
    2: ["Stella (600ml)", 9.49],
    3: ["Bohemia (350ml)", 3.99],
    4: ["Eisenbahn (600ml)", 6.49],
    5: ["Heineken  (600ml)", 9.18]
    }
    
    carrinho=[] #Uso de colchetes para o aramzenamento de dados de forma organizada.
    total=0

    while True:
        try:
            x=int(input("Digite a numeração da cerveja a sua escolha \n(pressione 0 para finalizar o pedido):"))
            if x==0:
                break #Interrompe o loop

            if x not in cerveja:
                print("Numeração inválida, tente novamente.")
                continue

            qnt=int(input("Quantidade de unidades a serem compradas:"))
            #qnt=quantidade
                
            [nome,preço]=cerveja[x]
            subtotal=qnt*preço
            carrinho.append((nome,preço,qnt,subtotal))
            print(f"{nome}Adicionado ao carrinho.")

            mais=(input("Deseja adicionar outro item, S ou N?")).lower() #.lower() converte os os strings em letras minúsculas
            if mais !="s":
                break

        except ValueError:
                print("Valor inválido, tente novamente")

    valor=sum(item[3] for item in carrinho)  
                
    if valor < 2500:
        print(f"O total de sua compra é de R${valor:.2f}, sem desconto.")
    elif 2500 <= valor < 6000:
        desconto = valor * 0.04
        print(f"O total de sua compra é de R${valor:.2f}")
        print("Você recebeu um desconto de 4%")
        print(f"Total a pagar: R${valor - desconto:.2f}")
    elif 6000 <= valor < 10000:
        desconto = valor * 0.07
        print(f"O total de sua compra é de R${valor:.2f}")
        print("Você recebeu um desconto de 7%")
        print(f"Total a pagar: R${valor - desconto:.2f}")
    else:  
        desconto = valor * 0.11
        print(f"O total de sua compra é de R${valor:.2f}")
        print("Você recebeu um desconto de 11%")
        print(f"Total a pagar: R${valor - desconto:.2f}")

    novo=str(input("Deseja fazer outro pedido, S ou N?")).lower()
    if novo !="s":
        print("Obrigado pela escolha, volte sempre.")
        break
 



