import 'package:app_p2sw1/presentacion/features/home/domain/datasources/home_datasource.dart';
import 'package:app_p2sw1/presentacion/features/home/domain/entities/auth.dart';
import 'package:app_p2sw1/presentacion/features/home/domain/repositories/home_repostory.dart';
import 'package:app_p2sw1/presentacion/features/home/infrastructure/datasources/home-datasource-impl.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepositoryImpl({HomeDataSource? homeDataSource})
      : _homeDataSource = homeDataSource ?? HomeDatasourceImpl();

  @override
  Future<AuthUser> loginUser(String email) async {
    return await _homeDataSource.loginUser(email);
  }
}
