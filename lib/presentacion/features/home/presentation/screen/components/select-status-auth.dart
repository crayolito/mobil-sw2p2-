import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/config/paleta-colores.dart';
import 'package:app_p2sw1/presentacion/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectorCustomDropdownButtonField extends StatelessWidget {
  const SelectorCustomDropdownButtonField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final List<String> listaRolesAuth = [
      "Puntos Alojamiento",
      "Atracciones Turisticas",
      "Centros de Vuelos",
    ];
    final decoration = InputDecoration(
      labelText: "Estado de Ingreso",
      labelStyle: GoogleFonts.anta(
        fontSize: 20,
        color: Colors.black,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kTerciaryColor, width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: Icon(
        Icons.co_present_outlined,
        size: size.width * 0.065,
        shadows: shadowPPN3,
      ),
    );

    return DropdownButtonFormField<String>(
        items: listaRolesAuth.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: GoogleFonts.anta(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          authenticationBloc.add(OnChangeEstadoAuth(newValue!));
        },
        icon: Icon(
          Icons.arrow_drop_down,
          size: size.width * 0.07,
          shadows: shadowPP,
        ),
        iconSize: size.width * 0.065,
        enableFeedback: true,
        style: GoogleFonts.anta(
          fontSize: 20,
          color: const Color(0xff424530),
        ),
        decoration: decoration);
  }
}
