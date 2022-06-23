import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;

  Resultado(this.pontos);

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
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
