
# Desafio DART (O lado negro do código)

O programa neste projeto cria um menu onde podemos executar inicialmente dois jogos.

Os jogos estão funcionais, porem incompletos.

Abaixo seguem as descrições dos jogos:

## Jogo 1: Adivinhe o Número (Conceitos: Variáveis e Laços)
O computador escolhe um número secreto. O jogador tenta adivinhar. O programa avisa se o valor inserido é maior ou menor.

## Jogo 2: Jokenpô / Pedra, Papel e Tesoura (Conceitos: Condicionais)
O usuário joga contra a máquina, que faz uma escolha aleatória.

# Desafios:

## Jogo 1:

Para consolidar seu aprendizado na linguagem Dart, tente modificar o código acima resolvendo estes três desafios propostos:

### Desafio 1 (Tratamento de Limites): 

Impeça que o jogador perca tentativas digitando números fora do intervalo (menores que 1 ou maiores que 100).

### Desafio 2 (Modo Difícil com Limite): 

Crie um limite máximo de 7 tentativas. Se o jogador não acertar até lá, exiba "Fim de Jogo" e revele o número correto.

### Desafio 3 (Criar uma Função Separada): 

Mova toda a lógica de validação da entrada do usuário para uma função dedicada chamada int obterPalpiteValido().

## Jogo 2

### Desafio 4 (Placar Acumulativo): 

Crie duas variáveis para armazenar a pontuação (vitoriasJogador e vitoriasComputador) e exiba o placar atualizado a cada rodada.

### Desafio 5 (Uso de Enums): 

Em vez de usar strings puras ('pedra', 'papel'), substitua as jogadas por um enum Jogada { pedra, papel, tesoura } para tornar o código fortemente tipado.

### Desafio 6 (Melhor de Três): 

Altere a estrutura do laço para que o jogo termine automaticamente assim que o jogador ou o computador alcançar 3 vitórias.

###