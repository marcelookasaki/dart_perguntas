import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua banda favorita?',
        'respostas': ['Led Zeppelin', 'Beach Boys', 'Rolling Stones', 'Beatles']
      },
      {
        'texto': 'Qual é a sua música favorita?',
        'respostas': [
          'Stairway to heaven',
          'God only knows',
          'Start me up',
          'Let it be'
        ]
      },
      {
        'texto': 'Qual é a seu artista favorito?',
        'respostas': [
          'David Bowie',
          'Lou Reed',
          'Janis Joplin',
          'Jimmy Hendrix'
        ]
      }
    ];

    List<Widget> respostas = [];

    for (var textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
