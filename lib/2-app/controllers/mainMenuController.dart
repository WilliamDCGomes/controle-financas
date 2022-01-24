import 'dart:math';
import 'dart:ui';
import 'package:flutter_flavorizr/parser/models/flavors/flavor.dart';
import 'package:flutter_project/1-base/models/exercise.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  late String nameUser;
  late String nameInitials;
  late RxBool hasPicture;
  late RxString welcomePhrase;
  late final List<Color> colors;
  late final List<Exercise> favoriteExercises;
  late final List<Exercise> recommendedExercise;
  late final List<Exercise> lastAddedExercises;

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
    favoriteExercises = <Exercise>[];
    recommendedExercise = <Exercise>[];
    lastAddedExercises = <Exercise>[];
  }

  _getExercises(){
    for(int i = 0; i < 5; i++){
      Exercise exercise = Exercise();
      int difficulty = Random().nextInt(5) + 1;
      switch(i){
        case 0:
          exercise.exerciseCode = 1;
          exercise.title = "Desenhando Labirintos";
          exercise.necessaryKnowledge = "C#;Ruby;Programação Orientada a Objetos;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Gabriel Jesus da Fonseca da Cruz";
          break;
        case 1:
          exercise.exerciseCode = 2;
          exercise.title = "Programação de Viagem";
          exercise.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "William Douglas";
          break;
        case 2:
          exercise.exerciseCode = 3;
          exercise.title = "Percurso em Árvore por Nível";
          exercise.necessaryKnowledge = "Html;CSS;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Bárbara Ribeiro";
          break;
        case 3:
          exercise.exerciseCode = 4;
          exercise.title = "Aproveite a Oferta";
          exercise.necessaryKnowledge = "C++;Java;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Carol Molina";
          break;
        case 4:
          exercise.exerciseCode = 5;
          exercise.title = "Diamantes e Areia";
          exercise.necessaryKnowledge = "Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Thomas Richard";
          break;
      }
      exercise.difficultyLevel = difficulty;
      exercise.siteOrigem = "www.urionlinejudge.com.br";
      exercise.isFavorited = true;
      favoriteExercises.add(exercise);
    }
    for(int i = 0; i < 5; i++){
      Exercise exercise = Exercise();
      int difficulty = Random().nextInt(5) + 1;
      switch(i){
        case 0:
          exercise.exerciseCode = 6;
          exercise.title = "Programação de Viagem";
          exercise.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "William Douglas";
          break;
        case 1:
          exercise.exerciseCode = 7;
          exercise.title = "Percurso em Árvore por Nível";
          exercise.necessaryKnowledge = "Html;CSS;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Bárbara Ribeiro";
          break;
        case 2:
          exercise.exerciseCode = 8;
          exercise.title = "Aproveite a Oferta";
          exercise.necessaryKnowledge = "C++;Java;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Carol Molina";
          break;
        case 3:
          exercise.exerciseCode = 9;
          exercise.title = "Diamantes e Areia";
          exercise.necessaryKnowledge = "Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Thomas Richard";
          break;
        case 4:
          exercise.exerciseCode = 10;
          exercise.title = "Programação de Viagem";
          exercise.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "William Douglas";
          break;
      }
      exercise.difficultyLevel = difficulty;
      exercise.siteOrigem = "www.urionlinejudge.com.br";
      exercise.isFavorited = false;
      recommendedExercise.add(exercise);
    }
    for(int i = 0; i < 4; i++){
      Exercise exercise = Exercise();
      int difficulty = Random().nextInt(5) + 1;
      switch(i){
        case 0:
          exercise.exerciseCode = 11;
          exercise.title = "Percurso em Árvore por Nível";
          exercise.necessaryKnowledge = "Html;CSS;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Bárbara Ribeiro";
          break;
        case 1:
          exercise.exerciseCode = 12;
          exercise.title = "Aproveite a Oferta";
          exercise.necessaryKnowledge = "C++;Java;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Carol Molina";
          break;
        case 2:
          exercise.exerciseCode = 13;
          exercise.title = "Diamantes e Areia";
          exercise.necessaryKnowledge = "Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "Thomas Richard";
          break;
        case 3:
          exercise.exerciseCode = 14;
          exercise.title = "Programação de Viagem";
          exercise.necessaryKnowledge = "Grafos;Lógica de Programação;Programação Dinâmica";
          exercise.description = "A entrada consiste em diversas casos de teste. A primeira linha de cada caso contém dois inteiros C (1 ≤ C ≤ 15) e E (1 ≤ E ≤ 225), que indicam a quantidade de cidades e estradas. As E linhas seguintes contém três inteiros C1, C2 e T, que identificam o tempo médio T de deslocamento entre as cidades C1, C2. Por fim, um inteiro D identifica a cidade em que Valentina se encontra no momento. Uma linha com 0 0 finaliza a entrada.";
          exercise.authorsComment = "William Douglas";
          break;
      }
      exercise.difficultyLevel = difficulty;
      exercise.siteOrigem = "www.urionlinejudge.com.br";
      exercise.isFavorited = false;
      lastAddedExercises.add(exercise);
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