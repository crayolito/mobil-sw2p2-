part of 'authentication_bloc.dart';

enum EstadoAuth { ninguno, alojamiento, aerolinea, turismo }

class AuthenticationState extends Equatable {
  final String tokenAuth;
  final EstadoAuth estadoAuth;
  final AuthUser? authUser;

  const AuthenticationState(
      {this.estadoAuth = EstadoAuth.ninguno,
      this.tokenAuth = '',
      this.authUser});

  AuthenticationState copyWith({
    EstadoAuth? estadoAuth,
    String? tokenAuth,
    AuthUser? authUser,
  }) {
    return AuthenticationState(
      estadoAuth: estadoAuth ?? this.estadoAuth,
      tokenAuth: tokenAuth ?? this.tokenAuth,
      authUser: authUser ?? this.authUser,
    );
  }

  @override
  List<Object?> get props => [
        estadoAuth,
        tokenAuth,
        authUser,
      ];
}
