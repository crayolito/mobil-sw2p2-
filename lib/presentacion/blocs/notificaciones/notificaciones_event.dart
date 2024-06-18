part of 'notificaciones_bloc.dart';

class NotificacionesEvent extends Equatable {
  const NotificacionesEvent();

  @override
  List<Object> get props => [];
}

class OnAddNotifi extends NotificacionesEvent {
  final PushMessage notificacion;
  // ignore: prefer_const_constructors_in_immutables
  OnAddNotifi(this.notificacion);
}

class OnChangePermissionNotifi extends NotificacionesEvent {
  final AuthorizationStatus status;
  // ignore: prefer_const_constructors_in_immutables
  OnChangePermissionNotifi(this.status);
}

class OnNotificationReceived extends NotificacionesEvent {
  final PushMessage message;
  // ignore: prefer_const_constructors_in_immutables
  OnNotificationReceived(this.message);
}

class OnLocalNotificacionMessage extends NotificacionesEvent {
  const OnLocalNotificacionMessage();
}
