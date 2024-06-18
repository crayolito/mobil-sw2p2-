import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/formulario-screen.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/list-state-form-screen.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/map-screen.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/search-point-screen.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/authentication-screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  // NOTIFICACIONES
  // GoRoute(
  //   path: '/push-details/:messageId',
  //   builder: (context, state) {
  //     print(state.pathParameters['messageId']);
  //     return DetailsScreen(
  //       pushMessageId: state.pathParameters['messageId'] ?? '',
  //     );
  //   },
  // ),
  // Alojamientos
  GoRoute(
      path: '/mapa-alojamientos',
      builder: (context, state) => const MapScreenn()),
  GoRoute(
      path: '/search-point',
      builder: (context, state) => const SearchPointScreen()),
  GoRoute(
      path: '/list-state-form',
      builder: (context, state) => const ListStateFormScreen()),
  GoRoute(
      path: '/formulario',
      builder: (context, state) => const FormularioScreen()),
]);
