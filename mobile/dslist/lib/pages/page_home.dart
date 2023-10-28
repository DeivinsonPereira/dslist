import 'package:dslist/entities/game_list.dart';
import 'package:dslist/pages/detalhes_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<GameList> games = [];

@override
  void initState() {
    super.initState();
    fetchGames();
  }

Future<List<GameList>> fetchGames() async {
  final response = await http.get(Uri.parse('http://localhost:8080/lists'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<GameList> gamesObtidos = data.map((item) => GameList.fromJson(item)).toList();
    
    setState(() {
      games = gamesObtidos;
    });
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Falha ao carregar os filmes');
  }
}

  _auxiliar() {
   games.isEmpty
   ? const Center(
    child: CircularProgressIndicator(),
   )     
   : ListView.builder(
  itemCount: games.length,
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text(games[index].name),
    );
  },
);

 _movie_list(){
  ListView.builder(
  itemCount: games.length,
  itemBuilder: (BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesGameScreen(games[index], game: games),
          ),
        );
      },
      child: ListTile(
        leading: Image.network(games[index].name),
      ),
    );
  },
)
 }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.white,
          child: const Text(
            'DS LIST',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            _movie_list();
          )
        ],
      ),
    );
  }
}
