class City {
  int? id;
  String? name;

  City({this.name, this.id});

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["nome"],
      );

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }
}
