import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final int idGame;
  const GamePage({Key? key, required this.idGame}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Jogo'),
      ),
      body: Center(
        child: Text('Seu jogo: $idGame'),
      ),
    );
  }
}
