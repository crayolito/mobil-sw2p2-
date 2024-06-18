import 'dart:io';

import 'package:app_p2sw1/config/local_notificacions/local_notificacions.dart';
import 'package:app_p2sw1/domain/entities/push_message.dart';
import 'package:app_p2sw1/firebase_options.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/data/map-theme.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notificaciones_event.dart';
part 'notificaciones_state.dart';

// edff4MKGRFqad3TdYzsPcx:APA91bFXjQHdEAM0YST5aXdw-1-nEqjTQds_on8sIJkz0tVMDNuZpSWw_zo3j7apjhuAM0Sn2B7QhRoUqTpmi-Urm92XltwX0x0xpuVGeKAVthwlexRKV9k7-wedMbHLKl5aAV5x89AX

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

class NotificacionesBloc
    extends Bloc<NotificacionesEvent, NotificacionesState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificacionesBloc() : super(const NotificacionesState()) {
    on<OnChangePermissionNotifi>(_onChangePermissionNotifi);
    on<OnNotificationReceived>(_onNotificationReceived);
    on<OnLocalNotificacionMessage>((event, emit) {
      int numeroFormulariosEstadoFalse =
          formulariosOpiniones.where((formulario) => !formulario.estado).length;
      LocalNotifications.showLocalNotification(
        id: 1,
        title: 'UrpiTours.com valora tu opinión',
        body:
            'Hola, en UrpiTours siempre estamos buscando mejorar nuestra calidad de servicio. Te quedan $numeroFormulariosEstadoFalse formularios por completar. Nos encantaría conocer tu opinión. ¿Podrías tomarte un momento para llenar nuestro cuestionario? ¡Gracias por ayudarnos a crecer!',
        // data: notification.data.toString(),
      );
    });
    // Verificar estado de las notificaciones
    _initialStatusCheck();
    // Listener para mensajes en primer plano (foreground)
    _onForegroundMessage();
  }

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _onChangePermissionNotifi(event, emit) {
    emit(state.copyWith(
      status: event.status,
    ));
    _getFCMToken();
  }

  void _onNotificationReceived(event, emit) {
    emit(state.copyWith(
      notifications: [...state.notifications, event.message],
    ));
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(OnChangePermissionNotifi(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await messaging.getToken();
      print('Token: $token');
    }
  }

  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;
    final notification = PushMessage(
      messageId:
          message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
      title: message.notification!.title ?? '',
      body: message.notification!.body ?? '',
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageURL: Platform.isAndroid
          ? message.notification!.android?.imageUrl
          : message.notification!.apple?.imageUrl,
    );
    // print(pushMessage.toString());
    LocalNotifications.showLocalNotification(
      id: 1,
      body: notification.body,
      data: notification.data.toString(),
      title: notification.title,
    );
    add(OnNotificationReceived(notification));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  Future<void> requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    // TODO: SOLICITAR PERMISOS DE NOTIFICACIONES LOCALES
    await LocalNotifications.requestPermissionLocalNotifications();
    add(OnChangePermissionNotifi(settings.authorizationStatus));
  }

  PushMessage? getMessageById(String messageId) {
    final exist =
        state.notifications.any((element) => element.messageId == messageId);
    if (exist) {
      return state.notifications
          .firstWhere((element) => element.messageId == messageId);
    }
    return null;
  }
}
