import 'package:dslist/entities/game_list.dart';
import 'package:flutter/material.dart';

class DetalhesGameScreen extends StatelessWidget {
  final GameList game;

  const DetalhesGameScreen(GameList gameList, {super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descrição do jogo'),
      ),
      body: Center(
          //child: Column(
          //  children: [
          //    Image.network(game.name),
          //    Text(filme.titulo),
          //    Text(filme.descricao),
          // Outras informações detalhadas do filme
          //    ],
          //     ),
          ),
    );
  }
}
