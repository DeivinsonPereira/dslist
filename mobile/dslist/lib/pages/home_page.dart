import 'package:dslist/core/app_methods.dart';
import 'package:dslist/core/app_requisition.dart';
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
      body: Container(
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
                    categoryImage = gameCard(
                        'https://cdn.pixabay.com/photo/2017/08/01/14/42/knight-2565957_1280.jpg');
                  } else if (snapshot.data![index]['name'] ==
                      'Jogos de plataforma') {
                    categoryImage = gameCard(
                        'https://cdn.pixabay.com/photo/2016/07/30/21/03/mario-1558012_1280.jpg');
                  } else {
                    categoryImage = Image.asset('');
                  }
                  return Center(
                    child: ListTile(
                      leading: categoryImage,
                      minVerticalPadding: 30,
                      title: Text(
                        snapshot.data![index]['name'],
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
    );
  }
}
