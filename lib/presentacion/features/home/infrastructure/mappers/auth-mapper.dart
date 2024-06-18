import 'package:app_p2sw1/presentacion/features/home/domain/entities/auth.dart';

class AuthUserMapper {
  static AuthUser fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  static Map<String, dynamic> toJson(AuthUser authUser) {
    return {
      'id': authUser.id,
      'email': authUser.email,
      'password': authUser.password,
    };
  }
}
