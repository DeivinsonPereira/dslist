import 'package:dslist/core/app_requisition.dart';
import 'package:dslist/pages/Games/game_page.dart';
import 'package:flutter/material.dart';

Widget gameList(String url) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Image.network(
      url,
      width: 100,
      height: 100,
      fit: BoxFit.fill,
    ),
  );
}

Widget gameCard(int id) {
  return FutureBuilder<List<dynamic>>(
    future: pegarGamesByCategory(id),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Center(
          child: Text('Erro ao carregar games'),
        );
      }
      if (snapshot.hasData) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 223, 223, 223),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    var idGame = snapshot.data![index]['id'];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(idGame: idGame),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: gameList(
                      snapshot.data![index]['imgUrl'],
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${snapshot.data![index]['title']} - ',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${snapshot.data![index]['year'].toString()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data![index]['shortDescription'],
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
