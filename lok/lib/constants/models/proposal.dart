class Proposall {
  final dynamic name;
  final dynamic description;
  final dynamic link;
  final dynamic image;

  Proposall({
    required this.name, required this.description, required this.image, required this.link,
  });

  factory Proposall.fromJson(Map<String, dynamic> json) {
    return Proposall(
      name: json['name'],
      description: json['description'],
      link: json['link'],
      image: json['image'],
    );
  }
}