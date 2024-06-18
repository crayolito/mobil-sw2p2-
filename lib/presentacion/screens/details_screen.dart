// import 'package:app_p2sw1/domain/entities/push_message.dart';
// import 'package:app_p2sw1/presentacion/blocs/permissions/permissions_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key, required this.pushMessageId});

//   final String pushMessageId;

//   @override
//   Widget build(BuildContext context) {
//     final permissionsBloc = BlocProvider.of<PermissionsBloc>(context);
//     final message = permissionsBloc.getMessageById(pushMessageId);

//     return Scaffold(
//         appBar: AppBar(title: Text('Detalles Push Message')),
//         body: (message != null)
//             ? _DetailsView(message: message)
//             : const Center(
//                 child: Text('Mensaje no encontrado'),
//               ));
//   }
// }

// class _DetailsView extends StatelessWidget {
//   const _DetailsView({super.key, required this.message});

//   final PushMessage message;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//       child: Column(
//         children: [
//           if (message.imageURL != null) Image.network(message.imageURL!),
//           const SizedBox(height: 30),
//           Text(message.title),
//           Text(message.body),
//           const Divider(),
//           Text(message.data.toString())
//         ],
//       ),
//     );
//   }
// }
