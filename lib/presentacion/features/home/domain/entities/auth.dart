class AuthUser {
  String id;
  String email;
  String password;
  String role;

  AuthUser(
      {required this.id,
      required this.email,
      required this.password,
      required this.role});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        role: json['role']);
  }
}
