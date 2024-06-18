import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/config/paleta-colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.placeholder,
    required this.icon,
    required this.color,
    required this.keyboardType,
    required this.onChanged,
  });

  final String placeholder;
  final IconData icon;
  final Color color;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = InputDecoration(
        labelText: placeholder,
        labelStyle: GoogleFonts.anta(
          fontSize: 20,
          color: color,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kTerciaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: const Color(0xff424530),
        prefixIcon: Icon(
          icon,
          size: size.width * 0.065,
          shadows: shadowPPN3,
        ),
        isDense: true);

    return TextFormField(
        cursorColor: kSecondaryColor,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: GoogleFonts.anta(
            fontSize: 20, color: color, fontWeight: FontWeight.bold),
        decoration: decoration);
  }
}
