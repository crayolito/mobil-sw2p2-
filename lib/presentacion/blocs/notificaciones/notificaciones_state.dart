part of 'notificaciones_bloc.dart';

class NotificacionesState extends Equatable {
  final AuthorizationStatus status;
  // TODO : Crear mi modelo de notificaciones
  final List<PushMessage> notifications;

  // NOTIFICACION PARA ALUMNO
  final PushMessage? alumnoNotificacion;
  // NOTIFICACION PARA APODERADO
  final List<PushMessage> apoderadoNotificaciones;

  const NotificacionesState(
      {this.alumnoNotificacion,
      this.apoderadoNotificaciones = const [],
      this.status = AuthorizationStatus.notDetermined,
      this.notifications = const []});

  NotificacionesState copyWith({
    PushMessage? alumnoNotificacion,
    List<PushMessage>? apoderadoNotificaciones,
    AuthorizationStatus? status,
    List<PushMessage>? notifications,
  }) {
    return NotificacionesState(
      alumnoNotificacion: alumnoNotificacion ?? this.alumnoNotificacion,
      apoderadoNotificaciones:
          apoderadoNotificaciones ?? this.apoderadoNotificaciones,
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props => [
        alumnoNotificacion,
        apoderadoNotificaciones,
        status,
        notifications,
      ];
}
