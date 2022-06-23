import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontos, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontos < 20) {
      return 'Legal!';
    } else if (pontos < 27) {
      return 'Caraca!';
    } else if (pontos < 29) {
      return 'Muito bom!';
    } else {
      return 'Sabe tudo!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
