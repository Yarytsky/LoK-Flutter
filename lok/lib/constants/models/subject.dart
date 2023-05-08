class Subject {
  final dynamic name;
  final dynamic description;
  final dynamic id;
  final dynamic teacher;
  final String image;

  Subject({
    required this.name,
    required this.description,
    required this.id,
    required this.teacher,
    required this.image,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
        name: json['name'],
        description: json['description'],
        id: json['id'],
        teacher: json['teacher'],
        image: json['image']);
  }
}
