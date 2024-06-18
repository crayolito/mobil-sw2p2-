import 'package:app_p2sw1/presentacion/features/alojamientos/infrastructure/datasources/alojamiento_datasource_impl.dart';
import 'package:app_p2sw1/presentacion/features/home/domain/entities/auth.dart';
import 'package:app_p2sw1/presentacion/features/home/infrastructure/datasources/home-datasource-impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final alojamientoDataSourceImpl = AlojamientoDataSourceImpl();
  final homeDatasourceImpl = HomeDatasourceImpl();
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<OnChangeEstadoAuth>((event, emit) {
      switch (event.value) {
        case "Puntos Alojamiento":
          emit(state.copyWith(estadoAuth: EstadoAuth.alojamiento));
          break;
        case "Atracciones Turisticas":
          emit(state.copyWith(estadoAuth: EstadoAuth.turismo));
          break;
        case "Centros de Vuelos":
          emit(state.copyWith(estadoAuth: EstadoAuth.turismo));
          break;
      }
    });
    on<OnProcessFormAuthUser>((event, emit) async {
      try {
        final AuthUser authUser =
            await homeDatasourceImpl.loginUser("alejandro@gmail.com");
        emit(state.copyWith(authUser: authUser));
      } catch (e) {
        print(e);
      }
      // print({
      //   "email": state.authUser!.email,
      //   "password": state.authUser!.password,
      // });
    });
  }
}
