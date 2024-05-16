import 'package:flutter/material.dart';
import 'TelaDestino.dart';
import 'dart:async';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int lastIndex = 0;
  int score = 0;
  bool verify = false;
  TextStyle textStyle = const TextStyle(
      color: Color.fromRGBO(251, 250, 255, 1.0), fontFamily: 'Roboto');
  Color colorBtnTrue = const Color.fromRGBO(82, 234, 84, 1.0);
  Color colorBtnFalse = const Color.fromRGBO(243, 46, 126, 1.0);
  Color cinzaClaro = const Color.fromRGBO(89, 89, 89, 1.0);
  Color branco = const Color.fromRGBO(251, 250, 255, 1.0);
  Color corTitulo = const Color(0xff313131);

  double _seconds = 10;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Iniciar o timer quando o widget é criado

    startTimer();
  }

  @override
  void dispose() {
    // Certifique-se de cancelar o timer quando o widget é descartado
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    // Criar um timer que executa a cada segundo
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds == 0) {
          if (questionIndex == questions.length - 1) {
            //dispose();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaResultado(
                        score, questions.length, resetQuiz, verify)));
          }

          if (questionIndex == questions.length - 1) {
            verify = true;
          } else {
            verify = false;
          }

          if (questionIndex < questions.length - 1) {
            questionIndex++;
            _seconds = 11;
          }
        }

        _seconds--;
      });
    });
  }

  //fazer de forma dinamica por meio de um método que insira no fim da lista
  //o novo nó com novos parâmetros quando um determinado btn for pressed

  //lista estática das perguntas do quiz
  List<Question> questions = [
    Question('Flutter é uma linguagem de programação?', 1),
    Question('Dart é uma linguagem de programação Orientada a Objetos?', 2),
    Question('O flutter é para Android?', 3),
    Question('O flutter é para iOS?', 4),
    Question('aaaaaa', 1),
    Question('teste', 2)
  ];

  //List<BtnAnswers> answersList = [BtnAnswers(1, 'testando', Colors.orange)];

  //verificação de resposta
  void checkAnswer(int userAnswer) {
    int correctAnswer = questions[questionIndex].answerIndex;

    if (questionIndex != questions.length - 1) {
      verify = false;
    }

    setState(() {
      if (userAnswer == correctAnswer &&
          score <= questions.length - 1 &&
          !verify) {
        score++;
      }

      if (questionIndex == questions.length - 1) {
        verify = true;
      } else {
        verify = false;
      }

      if (questionIndex == questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TelaResultado(score, questions.length, resetQuiz, verify)));
      }

      if (questionIndex < questions.length - 1 || _seconds == 0) {
        questionIndex++;
        _seconds = 10;
      }
    });
  }

  //reseta quiz
  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      _seconds = 10;
    });
  }

  //criador de botão de opção
  Widget btnOption(int answer, String text, Color cor) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            checkAnswer(answer);
          },
          child:
              Text(text, style: TextStyle(color: branco, fontFamily: 'Roboto')),
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            maximumSize: Size(300, 60),
            minimumSize: Size(300, 50),
          ),
        ));
  }

  //Lista de botões para resposta das perguntas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //CCONTAINER GERAL
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment(0.8, 1.5),
                    colors: [
                  Color.fromRGBO(67, 177, 244, 1.0),
                  Color.fromRGBO(83, 161, 243, 1.0),
                  Color.fromRGBO(109, 134, 251, 1.0),
                  Color.fromRGBO(126, 117, 252, 1.0),
                  Color.fromRGBO(145, 97, 253, 1.0),
                  Color.fromRGBO(160, 84, 245, 1.0),
                  Color.fromRGBO(181, 66, 253, 1.0),
                  Color.fromRGBO(202, 46, 249, 1.0)
                ])),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //CARD DA QUESTÃO
                  Center(
                      //CONTAINER DE CONFIGURAÇÃO DO CARD
                      child: Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(18.0),
                          height: 550,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(251, 250, 255, 1.0),
                          ),

                          //
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    //height: 80,
                                    //color: Colors.yellow,
                                    alignment: Alignment.center,

                                    //NÚMERO DA QUESTÃO

                                    //TIMER
                                    child: Container(
                                        //color: Colors.amber,
                                        width: 70,
                                        height: 70,
                                        //alignment: Alignment.center,
                                        child: Stack(
                                            //alignment: Alignment.center,
                                            fit: StackFit.expand,
                                            children: [
                                              CircularProgressIndicator(
                                                value: _seconds / 10,
                                                strokeWidth: 5,
                                              ),
                                              Center(
                                                child: Text(
                                                  '$_seconds',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 35.0),
                                                ),
                                              )
                                            ]))),
                                //TÍTULO DA QUESTÃO
                                Container(
                                  //color: Colors.amber,
                                  alignment: Alignment.center,
                                  height: 150,
                                  child: Text(
                                      questions[questionIndex].questiontext,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: corTitulo,
                                          fontFamily: 'Roboto',
                                          fontSize: 20.0)),
                                ),
                                //TÍTULO DA QUESTÃO/>

                                //OBS: fazer os botões mudarem a depender da pergunta em questão (lista dentro de lista?)
                                //BOTÕES
                                Container(
                                  height: 250,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      btnOption(1, 'Verdadeiro',
                                          Color.fromRGBO(83, 161, 243, 1.0)),
                                      btnOption(2, 'Falso',
                                          Color.fromRGBO(109, 134, 251, 1.0)),
                                      btnOption(3, 'teste',
                                          Color.fromRGBO(145, 97, 253, 1.0)),
                                      btnOption(4, 'text',
                                          Color.fromRGBO(181, 66, 253, 1.0))
                                    ],
                                  ),
                                )
                                //BOTÕES/>
                              ]))),
                  //ÁREA DA QUESTÃO/>
                ],
              ),
            )));
  }
}

//usar um evento do botão que toda vez q for clicado adicionar uma questão na lista
class Question {
  final String questiontext;
  final int answerIndex;

  Question(this.questiontext, this.answerIndex);
}

class BtnAnswers extends _QuizPageState {
  int answer;
  String text;
  Color cor;

  Widget btnOption1(int answer, String text, Color cor) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            checkAnswer(answer);
          },
          child:
              Text(text, style: TextStyle(color: branco, fontFamily: 'Roboto')),
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            maximumSize: Size(300, 60),
            minimumSize: Size(300, 50),
          ),
        ));
  }

  BtnAnswers(this.answer, this.text, this.cor);
}
/*
                Expanded(
                  flex: 3,
                  child: Image.network(
                    'https://www.trending.nl/wp-content/uploads/2021/08/quiz-1920x1509.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                */
