class Subject {
  final dynamic name;
  final dynamic description;

  Subject({
    required this.name, required this.description,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'],
      description: json['description'],
    );
  }
}