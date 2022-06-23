import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontosTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua banda favorita?',
      'respostas': [
        {'texto': 'Led Zeppelin', 'pontos': 9},
        {'texto': 'Beach Boys', 'pontos': 9},
        {'texto': 'Rolling Stones', 'pontos': 10},
        {'texto': 'Beatles', 'pontos': 8},
      ]
    },
    {
      'texto': 'Qual é a sua música favorita?',
      'respostas': [
        {'texto': 'Stairway to heaven', 'pontos': 10},
        {'texto': 'God only knows', 'pontos': 10},
        {'texto': 'Start me up', 'pontos': 8},
        {'texto': 'Let it be', 'pontos': 9},
      ]
    },
    {
      'texto': 'Qual é a seu artista favorito?',
      'respostas': [
        {'texto': 'David Bowie', 'pontos': 10},
        {'texto': 'Lou Reed', 'pontos': 9},
        {'texto': 'Janis Joplin', 'pontos': 8},
        {'texto': 'Jimmy Hendrix', 'pontos': 10},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontosTotal += pontos;
      });
    }
    print(_pontosTotal);
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
            : Resultado(_pontosTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
