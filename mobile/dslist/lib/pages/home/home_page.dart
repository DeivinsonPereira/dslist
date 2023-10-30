import 'package:dslist/core/app_methods.dart';
import 'package:dslist/core/app_requisition.dart';
import 'package:dslist/pages/game_lists/aventura_rpg.dart';
import 'package:dslist/pages/game_lists/jogos_plataforma.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.white,
          child: const Text(
            'Categorias de Jogos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0, bottom: 20),
            child: Text(
              'Escolha uma categoria e aperte para ver os jogos.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: FutureBuilder<List>(
                future: pegarGames(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro ao carregar games'),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Widget categoryImage;
                        //condição feita apenas para esse projeto, pois, não havia imagens no banco de dados.

                        if (snapshot.data![index]['name'] == 'Aventura e RPG') {
                          categoryImage = gameList(
                              'https://cdn.pixabay.com/photo/2017/08/01/14/42/knight-2565957_1280.jpg');
                        } else if (snapshot.data![index]['name'] ==
                            'Jogos de plataforma') {
                          categoryImage = gameList(
                              'https://cdn.pixabay.com/photo/2016/07/30/21/03/mario-1558012_1280.jpg');
                        } else {
                          categoryImage = Image.asset('');
                        }
                        return Center(
                          child: InkWell(
                            onTap: () {
                              if (snapshot.data![index]['name'] ==
                                  'Aventura e RPG') {
                                int id = snapshot.data![index]['id'];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JogosAventuraRPG(id: id),
                                  ),
                                );
                              } else if (snapshot.data![index]['name'] ==
                                  'Jogos de plataforma') {
                                var id = snapshot.data![index]['id'];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JogosPlataforma(id: id),
                                  ),
                                );
                              }
                            },
                            child: ListTile(
                              leading: categoryImage,
                              minVerticalPadding: 30,
                              title: Text(
                                snapshot.data![index]['name'],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
