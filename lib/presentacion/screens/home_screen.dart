// import 'package:app_p2sw1/presentacion/blocs/permissions/permissions_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final permissionsBloc = BlocProvider.of<PermissionsBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         // title: context
//         // .select((PermissionsBloc bloc) => Text('${bloc.state.status}')),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 // permissionsBloc.requestPermissions();
//               },
//               icon: const Icon(Icons.settings))
//         ],
//       ),
//       body: const _HomeView(),
//     );
//   }
// }

// class _HomeView extends StatelessWidget {
//   const _HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final permissionsBloc =
//         BlocProvider.of<PermissionsBloc>(context, listen: true);

//     return ListView.builder(
//         itemCount: permissionsBloc.state.notifications.length,
//         itemBuilder: (context, index) {
//           final notificacion = permissionsBloc.state.notifications[index];
//           return ListTile(
//             onTap: () async {
//               context.push('/push-details/${notificacion.messageId}');

//               // await LocalNotifications.showLocalNotification(
//               //     id: 0,
//               //     title: notificacion.title,
//               //     body: notificacion.body,
//               //     data: notificacion.messageId);
//             },
//             title: Text(notificacion.title),
//             subtitle: Text(notificacion.body),
//             leading: notificacion.imageURL != null
//                 ? Image.network(notificacion.imageURL!)
//                 : null,
//           );
//         });
//   }
// }
