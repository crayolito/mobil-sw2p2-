import 'dart:io';
import 'package:expandable_text/expandable_text.dart';
import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/config/paleta-colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDialogCustom {
  static void showLoadingMessage(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Android
    if (Platform.isAndroid) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: kPrimaryColor, width: 3)),
              title: Column(
                children: [
                  Text("Espere por favor",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anta(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: shadowPPN2)),
                  Container(
                      height: 3,
                      width: size.width * 0.55,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ))
                ],
              ),
              content: const SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
                  ),
                ),
              )));
      return;
    }

    showCupertinoDialog(
        context: context,
        builder: (context) => const CupertinoAlertDialog(
              title: Text('Espere por favor'),
              content: CupertinoActivityIndicator(),
            ));
  }

  static void showMessageIA(BuildContext context) {
    final size = MediaQuery.of(context).size;

    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xff424530),
                  width: 4,
                ),
              ),
              height: size.height * 0.5,
              width: size.width * 0.8,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Text(
                      "PLAN ESTUDIO",
                      style: GoogleFonts.anta(
                          shadows: shadowPP,
                          fontSize: 28,
                          color: const Color(0xff424530),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showMessageAVIZO(BuildContext context, String mensaje) {
    final size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: kPrimaryColor,
                width: 4,
              ),
            ),
            height:
                size.height * 0.8, // Aumenta la altura para acomodar más texto
            width: size.width * 0.8,
            child: Material(
              color: Colors.transparent,
              child: SingleChildScrollView(
                // Agrega un SingleChildScrollView para permitir el desplazamiento
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Plan de Viaje",
                      style: GoogleFonts.anta(
                        shadows: shadowPP,
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    ExpandableText(
                      mensaje,
                      expandText: 'leer más',
                      collapseText: 'leer menos',
                      maxLines: 18,
                      linkColor: Colors.blue,
                      style: GoogleFonts.anta(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
