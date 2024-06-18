import 'package:app_p2sw1/presentacion/blocs/authentication/authentication_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/notificaciones/notificaciones_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/permissions/permissions_bloc.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/authentication-screen.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/components/button-next-auth.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/components/select-status-auth.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/components/textFromCustom-auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FormCustomAuth extends StatefulWidget {
  const FormCustomAuth({
    super.key,
  });

  @override
  State<FormCustomAuth> createState() => _FormCustomAuthState();
}

class _FormCustomAuthState extends State<FormCustomAuth> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    final notificacionesBloc = BlocProvider.of<NotificacionesBloc>(context);
    final permissionsBloc = BlocProvider.of<PermissionsBloc>(context);
    final authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        height: size.height * 0.4,
        width: size.width,
        child: Column(
          children: [
            CustomTextFormField(
                placeholder: "Correo Electronico",
                icon: Icons.email,
                color: Colors.black,
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                }),
            SizedBox(
              height: size.height * 0.03,
            ),
            // READ : SELECTOR DE OPCIONES PARA VER SI ES UN (PROFESOR ESTUDIANTE CHOFER APODERADO)
            const SelectorCustomDropdownButtonField(),
            SizedBox(
              height: size.height * 0.03,
            ),
            ButtonAuthentication(onTap: () async {
              // NOTE : CUANDO SOLUCIONE TAKESHI DESCOMENTALO
              authenticationBloc.add(OnProcessFormAuthUser(email));
              await Future.wait([
                permissionsBloc.askGpsAccess(),
                notificacionesBloc.requestPermissions(),
              ]);
              if (!mounted) return;
              switch (authenticationBloc.state.estadoAuth) {
                case EstadoAuth.alojamiento:
                  context.push("/mapa-alojamientos");
                  break;
                case EstadoAuth.aerolinea:
                  context.push("/mapa-alojamientos");
                  break;
                case EstadoAuth.turismo:
                  context.push("/mapa-alojamientos");
                  break;
                default:
                  break;
              }
            }),
            SizedBox(
              height: size.height * 0.02,
            ),
            // READ : MESSAGE DE PETICION DE REGISTRO
            const MessageRegistrationRequest()
          ],
        ),
      ),
    );
  }
}
