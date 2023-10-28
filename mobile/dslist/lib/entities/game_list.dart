class GameList {
  final String name;


  GameList({
    required this.name,
  });

  factory GameList.fromJson(Map<String, dynamic> json) {
    return GameList(
      name: json['name'],
    );
  }
}