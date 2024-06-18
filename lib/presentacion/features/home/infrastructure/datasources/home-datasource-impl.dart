import 'package:app_p2sw1/presentacion/features/home/domain/datasources/home_datasource.dart';
import 'package:app_p2sw1/presentacion/features/home/domain/entities/auth.dart';
import 'package:dio/dio.dart';

class HomeDatasourceImpl implements HomeDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://springbootgraphqlsw2-production.up.railway.app',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  @override
  Future<AuthUser> loginUser(String email) async {
    var data = {"email": email, "password": "clave123"};

    try {
      var response = await dio.request('/login',
          options: Options(
            method: 'POST',
          ),
          data: data);

      if (response.statusCode == 200) {
        final structureData = AuthUser.fromJson(response.data);
        return structureData;
      } else {
        throw Exception('No fue una respuesta 200 Auth Usuario');
      }
    } catch (e) {
      throw Exception(
        'Error al obtener los datos usuario $e',
      );
    }
  }
}
