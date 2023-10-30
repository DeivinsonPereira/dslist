import 'package:dslist/core/app_methods.dart';
import 'package:flutter/material.dart';

class JogosAventuraRPG extends StatefulWidget {
  final int id;
  const JogosAventuraRPG({Key? key, required this.id}) : super(key: key);

  @override
  State<JogosAventuraRPG> createState() => _JogosAventuraRPGState(id);
}

class _JogosAventuraRPGState extends State<JogosAventuraRPG> {
  final int id;

  _JogosAventuraRPGState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Jogos de Aventura e RPG',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: gameCard(id),);
  }
}
