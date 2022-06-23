import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
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
      'respostas': ['David Bowie', 'Lou Reed', 'Janis Joplin', 'Jimmy Hendrix']
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
