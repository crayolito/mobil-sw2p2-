import 'package:app_p2sw1/config/local_notificacions/local_notificacions.dart';
import 'package:app_p2sw1/config/router/app_router.dart';
import 'package:app_p2sw1/presentacion/blocs/authentication/authentication_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/formulario/formulario_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/location/location_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/map/map_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/notificaciones/notificaciones_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/permissions/permissions_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // TODO : Initialize Firebase
  await NotificacionesBloc.initializeFCM();
  // TODO : Initialize Local Notifications
  await LocalNotifications.initializeLocalNotifications();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => PermissionsBloc()),
    BlocProvider(create: (context) => MapBloc()),
    BlocProvider(create: (context) => LocationBloc()),
    BlocProvider(create: (context) => NotificacionesBloc()),
    BlocProvider(create: (context) => AuthenticationBloc()),
    BlocProvider(
        create: (context) => FormularioBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context))),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          HandleNotificationInteractions(child: child!),
    );
  }
}

class HandleNotificationInteractions extends StatefulWidget {
  const HandleNotificationInteractions({super.key, required this.child});
  final Widget child;

  @override
  State<HandleNotificationInteractions> createState() =>
      _HandleNotificacionInteractionsState();
}

class _HandleNotificacionInteractionsState
    extends State<HandleNotificationInteractions> {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    // final permissionsBloc = BlocProvider.of<PermissionsBloc>(context);
    // permissionsBloc.handleRemoteMessage(message);
    context.read<NotificacionesBloc>().handleRemoteMessage(message);

    final messageId =
        message.messageId?.replaceAll(':', '').replaceAll('%', '');
    appRouter.push('/push-details/$messageId');

    // if (message.data['type'] == 'chat') {
    // Navigator.pushNamed(context, '/chat',
    //   arguments: ChatArguments(message),
    // );
    // }
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
