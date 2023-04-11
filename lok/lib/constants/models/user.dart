class User {
  final dynamic firstName;
  final dynamic lastname;
  final dynamic email;
  final dynamic normalizedUserName;
  final dynamic country;
  final dynamic gender;
  final dynamic attendance;
  final dynamic role;

  User({
    required this.firstName,
    required this.lastname,
    required this.email,
    required this.normalizedUserName,
    required this.role,
    this.country,
    this.gender,
    this.attendance,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastname: json['lastname'],
      email: json['email'],
      normalizedUserName: json['normalizedUserName'],
      country: json['country'],
      gender: json['gender'],
      attendance: json['attendance'],
      role: json['role'],
    );
  }
}