import 'package:app_p2sw1/presentacion/features/home/domain/entities/auth.dart';

abstract class HomeDataSource {
  Future<AuthUser> loginUser(String email);
}
