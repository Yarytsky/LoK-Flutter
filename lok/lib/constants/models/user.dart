class Movie {
  final String firstName;
  final String lastname;
  final String email;
  final String normalizedUserName;
  final dynamic country;
  final dynamic gender;
  final dynamic attendance;

  Movie({
    required this.firstName,
    required this.lastname,
    required this.email,
    required this.normalizedUserName,
    required this.country,
    required this.gender,
    required this.attendance,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      firstName: json['firstName'],
      lastname: json['lastname'],
      email: json['email'],
      normalizedUserName: json['normalizedUserName'],
      country: json['country'],
      gender: json['gender'],
      attendance: json['attendance'],
    );
  }
}
class loginUser{
  final String usernameOrEmail;
  final String password;

  loginUser(this.usernameOrEmail, this.password);
}