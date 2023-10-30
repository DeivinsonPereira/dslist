import 'package:dslist/core/app_methods.dart';
import 'package:flutter/material.dart';

class JogosPlataforma extends StatefulWidget {
  final int id;
  const JogosPlataforma({Key? key, required this.id}) : super(key: key);

  @override
  State<JogosPlataforma> createState() => _JogosPlataforma(id);
}

class _JogosPlataforma extends State<JogosPlataforma> {
  final int id;

  _JogosPlataforma(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jogos de Plataforma',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: gameCard(id),
    );
  }
}
