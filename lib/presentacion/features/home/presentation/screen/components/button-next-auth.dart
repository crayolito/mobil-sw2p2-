import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/config/paleta-colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAuthentication extends StatelessWidget {
  const ButtonAuthentication({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: kTerciaryColor,
    );
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.07,
        width: size.width * 0.35,
        decoration: decoration,
        child: Text(
          "Ingresar",
          style: GoogleFonts.anta(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            shadows: shadowPPN2,
          ),
        ),
      ),
    );
  }
}
