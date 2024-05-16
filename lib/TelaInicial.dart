import 'package:flutter/material.dart';
import 'TelaQuiz.dart';

class TelaInicial extends StatelessWidget {
  Color corFontTitle = Color.fromRGBO(251, 250, 255, 1.0);
  Color corFontBtn = Color.fromRGBO(89, 89, 89, 1.0);
  Color corIcone = Colors.white;

  //Icon icon = Icon(Icons.list, color: Colors.white);

  //função para criar o container do botão
  Widget botaoInicial(
      BuildContext context, String lblCaption, Color colorCircle, Icon icone) {
    return Container(
        //container para margin
        margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),

        //botão
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(300, 50),
                padding: EdgeInsets.all(3.0)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QuizPage()));
            },

            //interior do botão
            child: Row(
              children: [
                //container para círculo do icone
                Container(
                  padding: EdgeInsets.all(10),
                  child: icone,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: colorCircle,
                  ),
                ),

                //espaçamento entre icone e texto
                Padding(padding: EdgeInsets.only(left: 10)),

                Text(
                  lblCaption,
                  style: TextStyle(
                      color: corFontBtn, fontFamily: 'Roboto', fontSize: 20),
                ),
              ],
            )));
  }

  Widget build(BuildContext context) {
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

            //posição dos botões e título
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //título
                    Text('QuizGen',
                        style: TextStyle(
                            color: corFontTitle,
                            fontSize: 32,
                            fontFamily: 'Dunkin',
                            shadows: [
                              Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 4.0,
                                  color: Colors.black.withOpacity(0.3))
                            ])),

                    //distância
                    SizedBox(height: 30),

                    //BOTÕES -----------------------

                    //botão iniciar
                    botaoInicial(
                        context,
                        'Iniciar',
                        Colors.blue,
                        Icon(
                          Icons.list,
                          color: corIcone,
                        )),
                    //botão criar quiz
                    botaoInicial(
                        context,
                        'Criar Quiz',
                        Colors.purple,
                        Icon(
                          Icons.grade,
                          color: corIcone,
                        )),

                    botaoInicial(
                        context,
                        'Pontuações',
                        Colors.orange,
                        Icon(
                          Icons.people,
                          color: corIcone,
                        )),
                  ]),
            )));
  }
}
