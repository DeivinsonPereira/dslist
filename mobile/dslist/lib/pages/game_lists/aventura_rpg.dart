import 'package:dslist/core/app_methods.dart';
import 'package:dslist/core/app_requisition.dart';
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
      body: FutureBuilder<List<dynamic>>(
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
                          backgroundColor:
                              const Color.fromARGB(255, 223, 223, 223),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
                        child: ListTile(
                          leading: gameCard(
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
                                  style: TextStyle(
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
          }),
    );
  }
}
