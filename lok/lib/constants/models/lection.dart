class Lection {
  final dynamic name;
  final dynamic description;
  final dynamic link;

  Lection({
    required this.name, required this.description, required this.link,
  });

  factory Lection.fromJson(Map<String, dynamic> json) {
    return Lection(
      name: json['name'],
      description: json['description'],
      link: json['link'],
    );
  }
}