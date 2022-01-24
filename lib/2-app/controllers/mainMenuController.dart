import 'dart:math';
import 'dart:ui';
import 'package:financas_controle/1-base/models/bill.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  late String nameUser;
  late String nameInitials;
  late RxBool hasPicture;
  late RxString welcomePhrase;
  late final List<Color> colors;
  late final List<Bill> favoriteExercises;
  late final List<Bill> recommendedExercise;
  late final List<Bill> lastAddedExercises;

  MainMenuController(){
    _startVariables();
    _getExercises();
    _getNameUser();
    _getNameInitials();
    _getWelcomePhrase();
  }

  _startVariables(){
    hasPicture = false.obs;
    colors = [Color(0XFF484592), Color(0XFF619793)];
    favoriteExercises = <Bill>[];
    recommendedExercise = <Bill>[];
    lastAddedExercises = <Bill>[];
  }

  _getExercises(){
    for(int i = 0; i < 5; i++){
      Bill bill = Bill();
      int difficulty = Random().nextInt(5) + 1;
      switch(i){
        case 0:
          bill.billCode = 1;
          bill.title = "Desenhando Labirintos";
          bill.necessaryKnowledge = "C#;Ruby;Programação Orientada a Objetos;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Gabriel Jesus da Fonseca da Cruz";
          break;
        case 1:
          bill.billCode = 2;
          bill.title = "Programação de Viagem";
          bill.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "William Douglas";
          break;
        case 2:
          bill.billCode = 3;
          bill.title = "Percurso em Árvore por Nível";
          bill.necessaryKnowledge = "Html;CSS;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Bárbara Ribeiro";
          break;
        case 3:
          bill.billCode = 4;
          bill.title = "Aproveite a Oferta";
          bill.necessaryKnowledge = "C++;Java;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Carol Molina";
          break;
        case 4:
          bill.billCode = 5;
          bill.title = "Diamantes e Areia";
          bill.necessaryKnowledge = "Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Thomas Richard";
          break;
      }
      bill.difficultyLevel = difficulty;
      bill.siteOrigem = "www.urionlinejudge.com.br";
      bill.isFavorited = true;
      favoriteExercises.add(bill);
    }
    for(int i = 0; i < 5; i++){
      Bill bill = Bill();
      int difficulty = Random().nextInt(5) + 1;
      switch(i){
        case 0:
          bill.billCode = 6;
          bill.title = "Programação de Viagem";
          bill.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "William Douglas";
          break;
        case 1:
          bill.billCode = 7;
          bill.title = "Percurso em Árvore por Nível";
          bill.necessaryKnowledge = "Html;CSS;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Bárbara Ribeiro";
          break;
        case 2:
          bill.billCode = 8;
          bill.title = "Aproveite a Oferta";
          bill.necessaryKnowledge = "C++;Java;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Carol Molina";
          break;
        case 3:
          bill.billCode = 9;
          bill.title = "Diamantes e Areia";
          bill.necessaryKnowledge = "Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Thomas Richard";
          break;
        case 4:
          bill.billCode = 10;
          bill.title = "Programação de Viagem";
          bill.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "William Douglas";
          break;
      }
      bill.difficultyLevel = difficulty;
      bill.siteOrigem = "www.urionlinejudge.com.br";
      bill.isFavorited = false;
      recommendedExercise.add(bill);
    }
    for(int i = 0; i < 4; i++){
      Bill bill = Bill();
      int difficulty = Random().nextInt(5) + 1;
      switch(i){
        case 0:
          bill.billCode = 11;
          bill.title = "Percurso em Árvore por Nível";
          bill.necessaryKnowledge = "Html;CSS;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Bárbara Ribeiro";
          break;
        case 1:
          bill.billCode = 12;
          bill.title = "Aproveite a Oferta";
          bill.necessaryKnowledge = "C++;Java;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Carol Molina";
          break;
        case 2:
          bill.billCode = 13;
          bill.title = "Diamantes e Areia";
          bill.necessaryKnowledge = "Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "Thomas Richard";
          break;
        case 3:
          bill.billCode = 14;
          bill.title = "Programação de Viagem";
          bill.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          bill.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          bill.authorsComment = "William Douglas";
          break;
      }
      bill.difficultyLevel = difficulty;
      bill.siteOrigem = "www.urionlinejudge.com.br";
      bill.isFavorited = false;
      lastAddedExercises.add(bill);
    }
  }

  _getNameUser(){
    nameUser = "Will";
  }

  _getNameInitials(){
    nameInitials = "WG";
  }

  _getWelcomePhrase(){
    int currentHour = DateTime.now().hour;
    if(currentHour >= 0 && currentHour < 12)
      welcomePhrase = "Bom dia!".obs;
    else if(currentHour >= 12 && currentHour < 18)
      welcomePhrase = "Boa tarde!".obs;
    else
      welcomePhrase = "Boa noite!".obs;
  }
}