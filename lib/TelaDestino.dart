import 'package:flutter/material.dart';
import 'package:quiz/TelaQuiz.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;
  final Function resetQuiz;

  bool verify;

  TelaResultado(
      this.pontuacao, this.totalPerguntas, this.resetQuiz, this.verify);

  @override
  Widget build(BuildContext context) {
    Color fontColorPrincipal = const Color.fromRGBO(251, 250, 255, 1.0);
    Color corFontBtn = const Color.fromRGBO(89, 89, 89, 1.0);

    String mensagem;

    if (pontuacao > (totalPerguntas / 2)) {
      mensagem = 'Parabéns!';
    } else {
      mensagem = 'Melhore!';
    }

    return Scaffold(
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
              Text(
                mensagem,
                style: TextStyle(
                    fontSize: 32,
                    color: fontColorPrincipal,
                    fontFamily: 'Roboto',
                    shadows: [
                      Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          color: Colors.black.withOpacity(0.3))
                    ]),
              ),
              SizedBox(height: 20),
              Text('Pontuação: $pontuacao de $totalPerguntas',
                  style: TextStyle(
                      fontSize: 24,
                      color: fontColorPrincipal,
                      fontFamily: 'Roboto')),
              SizedBox(height: 20),

              //BOTÃO
              ///////////////////////////////
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(300, 50),
                      padding: EdgeInsets.all(3.0)),
                  onPressed: () {
                    resetQuiz();
                    Navigator.pop(context);
                  },

                  //interior do botão
                  child: Row(
                    children: [
                      //container para círculo do icone
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.keyboard_return, color: Colors.white),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.purple,
                        ),
                      ),

                      //espaçamento entre icone e texto
                      Padding(padding: EdgeInsets.only(left: 10)),

                      Text(
                        'Recomeçar',
                        style: TextStyle(
                            color: corFontBtn,
                            fontFamily: 'Roboto',
                            fontSize: 20),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
