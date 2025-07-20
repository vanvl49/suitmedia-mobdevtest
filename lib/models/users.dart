class Users {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Users({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json["id"] ?? 0,
      email: json["email"] ?? 'No email',
      first_name: json["first_name"] ?? "XXXX",
      last_name: json["last_name"] ?? "XXXX",
      avatar: json["avatar"] ?? "no foto.jpg",
    );
  }
}
