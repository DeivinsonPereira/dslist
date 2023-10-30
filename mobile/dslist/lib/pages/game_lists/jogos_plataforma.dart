import 'package:flutter/material.dart';

class JogosPlataforma extends StatefulWidget {
  const JogosPlataforma({super.key, required id});

  @override
  State<JogosPlataforma> createState() => _JogosPlataforma();
}

class _JogosPlataforma extends State<JogosPlataforma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos de Plataforma'),
      ),
      body: Text('aqui vem os jogos'),
    );
  }
}
