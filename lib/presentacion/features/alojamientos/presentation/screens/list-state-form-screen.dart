import 'dart:async';

import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/presentacion/blocs/formulario/formulario_bloc.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/data/show_message.dart';
import 'package:app_p2sw1/presentacion/shared/components/IconButtonCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FormularioOpinion {
  final String titulo;
  final bool estado;
  final String lugarOrigen;
  final String lugarDestino;
  final String nombreAlojamiento;
  final String opinionAlojamiento;
  final String opionLugarDestino;
  final String motivoViaje;

  FormularioOpinion({
    required this.titulo,
    required this.estado,
    required this.lugarOrigen,
    required this.lugarDestino,
    required this.nombreAlojamiento,
    required this.opinionAlojamiento,
    required this.opionLugarDestino,
    required this.motivoViaje,
  });
}

class ListStateFormScreen extends StatefulWidget {
  const ListStateFormScreen({super.key});

  @override
  State<ListStateFormScreen> createState() => _ListStateFormScreenState();
}

class _ListStateFormScreenState extends State<ListStateFormScreen> {
  StreamSubscription<FormularioState>? _formularioSubscription;
  late FormularioBloc formularioBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // // NOTE : CUANDO SOLUCIONE TAKESHI DESCOMENTALO
      // formularioBloc = BlocProvider.of<FormularioBloc>(context);
      // formularioBloc.add(const OnGetFormularios());
      // // Este código se ejecutará después de que el widget se haya construido completamente
      // print('El widget se ha construido completamente');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _formularioSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formularioBloc =
        BlocProvider.of<FormularioBloc>(context, listen: true);

    return Scaffold(
      floatingActionButton: IconButtonCustom(
          onPressed: () {
            context.pop();
          },
          icon: Icons.arrow_back,
          heroTag: "salir0011"),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const NetworkImage(
                  "https://i.pinimg.com/564x/92/ec/94/92ec948a4889c786322ec5363b4afaf3.jpg"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: size.height * 0.09,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.09,
                        width: size.width * 0.81,
                        child: Text("BUSCAMOS MEJORAR",
                            style: GoogleFonts.anta(
                                fontSize: 29,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                shadows: shadowPPN2)),
                      ),
                      IconButton(
                          onPressed: () {
                            formularioBloc.add(const OnApplyIA());
                            _formularioSubscription =
                                formularioBloc.stream.listen((state) {
                              final String mensaje = state.respuestIA;
                              if (mensaje.isNotEmpty) {
                                ShowDialogCustom.showMessageAVIZO(
                                    context, mensaje);
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.black,
                            shadows: shadowPPN3,
                            size: 35,
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.015,
                ),
                padding: EdgeInsets.only(
                  bottom: size.height * 0.015,
                ),
                height: size.height * 0.871,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...formularioBloc.state.formularios.map((formulario) {
                        return GestureDetector(
                          onTap: () {
                            if (formulario.estado) return;
                            formularioBloc.add(
                                OnSelectFormulario(formularioData: formulario));
                            context.push('/formulario');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                            ),
                            margin: EdgeInsets.only(
                              bottom: size.height * 0.015,
                            ),
                            width: size.width,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: size.height * 0.1,
                                  width: size.width * 0.13,
                                  padding: EdgeInsets.all(size.width * 0.015),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/iconFormulario.png"))),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: size.width * 0.03,
                                  ),
                                  height: size.height * 0.1,
                                  width: size.width * 0.61,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        formulario.estado
                                            ? "Gracias por tu opinión"
                                            : "Esperamos tu Opinion",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.anta(
                                          fontSize: 23,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1.0,
                                        ),
                                      ),
                                      Text(
                                        formulario.nombreAlojamiento,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.anta(
                                          fontSize: 20,
                                          color: Colors.black,
                                          letterSpacing: -1.0,
                                          height: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      formulario.estado
                                          ? FontAwesomeIcons.clipboardCheck
                                          : FontAwesomeIcons.clipboardQuestion,
                                      color: formulario.estado
                                          ? Colors.green
                                          : Colors.lightBlue,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
