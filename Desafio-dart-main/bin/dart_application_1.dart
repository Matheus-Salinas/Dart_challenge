import 'dart:io';
import 'dart:math';

enum Jogada { pedra, papel, tesoura }

void main() {
  bool executar = true;

  do {
    print('\n==================================================');
    print('   SISTEMA INTEGRADO DE EXERCÍCIOS - DART         ');
    print('==================================================');
    print('1. [Jogo 1] Adivinhe o Número (Conceitos: Variáveis e Laços)');
    print('2. [Jogo 2] Jokenpô / Pedra, Papel e Tesoura (Conceitos: Condicionais)');
    print('0. Sair do Sistema');
    print('==================================================');
    stdout.write('Escolha uma opção (0-2): ');
    
    String? entrada = stdin.readLineSync();
    
    switch (entrada) {
      case '1':
        adivinhe();
        break;
      case '2':
        jokenpo();
        break;
      case '0':
        print('\nEncerrando a aplicação... Até logo!');
        executar = false;
        break;
      default:
        print('\n[ERRO] Opção inválida! Digite um número de 0 a 2.'); 
    }

    if (executar) {
      print('\nPressione ENTER para voltar ao menu principal...');
      stdin.readLineSync();
    }

  } while (executar);
}

int obterPalpiteValido() {
  while (true) {
    stdout.write('Digite seu palpite (1 a 100): ');
    final entrada = stdin.readLineSync();

    if (entrada == null || int.tryParse(entrada) == null) {
      print('Por favor, digite um número válido!');
      continue;
    }

    int palpite = int.parse(entrada);

    if (palpite < 1 || palpite > 100) {
      print('Atenção: O número deve estar entre 1 e 100! Tente novamente.');
      continue;
    }

    return palpite; 
  }
}

void adivinhe() {
  final numeroSecreto = Random().nextInt(100) + 1;
  int tentativas = 0;
  int? palpite;
  
  final int limiteTentativas = 7; 

  print('\n=== BEM-VINDO AO JOGO DE ADIVINHAÇÃO ===');
  print('Tente adivinhar o número entre 1 e 100!');
  print('Modo Difícil: Você tem $limiteTentativas tentativas!\n');

  while (palpite != numeroSecreto && tentativas < limiteTentativas) {
    palpite = obterPalpiteValido();
    tentativas++;

    if (palpite < numeroSecreto) {
      print('Muito baixo! Tente um número maior.');
    } else if (palpite > numeroSecreto) {
      print('Muito alto! Tente um número menor.');
    } else {
      print('\n🎉 Parabéns! Você acertou em $tentativas tentativas.');
      return;
    }
    
    print('Tentativas restantes: ${limiteTentativas - tentativas}\n');
  }

  if (palpite != numeroSecreto) {
    print('Fim de Jogo! Você esgotou suas $limiteTentativas tentativas.');
    print('O número secreto era: $numeroSecreto.');
  }
}

Jogada? converterParaJogada(String entrada) {
  if (entrada == 'pedra') return Jogada.pedra;
  if (entrada == 'papel') return Jogada.papel;
  if (entrada == 'tesoura') return Jogada.tesoura;
  return null;
}

void jokenpo() {
  int vitoriasJogador = 0;
  int vitoriasComputador = 0;
  
  print('\n=== BEM-VINDO AO JOKENPÔ (MELHOR DE TRÊS) ===');
  print('Opções válidas: pedra, papel ou tesoura.');

  while (vitoriasJogador < 3 && vitoriasComputador < 3) {
    stdout.write('\nEscolha sua jogada (ou digite "sair"): ');
    final entrada = stdin.readLineSync()?.toLowerCase().trim();

    if (entrada == 'sair') {
      print('Obrigado por jogar!');
      return;
    }

    Jogada? jogadaJogador = converterParaJogada(entrada ?? '');

    if (jogadaJogador == null) {
      print('Jogada inválida! Escolha apenas pedra, papel ou tesoura.');
      continue;
    }

    final indiceAleatorio = Random().nextInt(Jogada.values.length);
    final jogadaComputador = Jogada.values[indiceAleatorio];

    print('Você escolheu: ${jogadaJogador.name}');
    print('O computador escolheu: ${jogadaComputador.name}');

    if (jogadaJogador == jogadaComputador) {
      print('Empate! Ninguém pontua. 🤝');
    } else if ((jogadaJogador == Jogada.pedra && jogadaComputador == Jogada.tesoura) ||
               (jogadaJogador == Jogada.papel && jogadaComputador == Jogada.pedra) ||
               (jogadaJogador == Jogada.tesoura && jogadaComputador == Jogada.papel)) {
      print('Você ganhou a rodada! 🎉');
      vitoriasJogador++;
    } else {
      print('O computador ganhou a rodada! 🤖');
      vitoriasComputador++;   
    }

    print('--- PLACAR: Você $vitoriasJogador x $vitoriasComputador Computador ---');
  }
  
  if (vitoriasJogador == 3) {
    print('\n🏆 PARABÉNS! Você venceu a melhor de três!');
  } else {
    print('\n💀 QUE PENA! O computador venceu a melhor de três!');
  }
}