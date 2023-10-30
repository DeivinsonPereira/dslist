import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> pegarGames() async {
  var url = Uri.parse('http://10.0.2.2:8080/lists');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Falha ao carregar os games.');
  }
}

Future<List<dynamic>> pegarGamesByCategory(int id) async {
  var url = Uri.parse('http://10.0.2.2:8080/lists/$id/games');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Falha ao carregar os games.');
  }
}

Future pegarGamesById(int id) async {
  var url = Uri.parse('http://10.0.2.2:8080/games/$id');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Falha ao carregar os games.');
  }
}