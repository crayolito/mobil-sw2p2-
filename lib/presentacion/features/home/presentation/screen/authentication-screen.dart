import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/components/formCustom-auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const decoration1 = BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/92/dd/21/92dd216ac2b1e353facd9864e31c4281.jpg"),
            fit: BoxFit.cover));
    final decoration2 =
        BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 10,
        spreadRadius: 5,
        offset: const Offset(0, 5),
      )
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.515,
              width: size.width,
              decoration: decoration1,
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.4))),
            ),
            const ContainerCustom(),
            Positioned(
              top: size.height * 0.17,
              left: size.width * 0.2,
              child: SizedBox(
                width: size.width * 0.6,
                height: size.height * 0.16,
                child: Text("UrpiTours",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.anta(
                        shadows: shadowPPN3,
                        fontSize: 47,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned(
              top: size.height * 0.3,
              left: size.width * 0.15,
              child: SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.16,
                child: Text(
                    "¡Bienvenidos! Comienza aqui tu viaje de descubrimienta",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: GoogleFonts.anta(
                      fontSize: 25,
                      color: Colors.white,
                    )),
              ),
            ),
            const FormCustomAuth(),
            Positioned(
                top: size.height * 0.46,
                left: size.width * 0.42,
                child: Container(
                  height: size.height * 0.1,
                  width: size.width * 0.15,
                  decoration: decoration2,
                  child: Icon(
                    FontAwesomeIcons.graduationCap,
                    color: Colors.black,
                    size: size.width * 0.07,
                    shadows: shadowPPN3,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MessageRegistrationRequest extends StatelessWidget {
  const MessageRegistrationRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: '¿Tienes una cuenta?\n',
              style: GoogleFonts.anta(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 3.5,
              )),
          TextSpan(
            text: 'Ingresa tu código para empezar.',
            style: GoogleFonts.anta(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: _CurvoContainer(),
        ));
  }
}

class _CurvoContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    // lapiz.color = Color(0xFFFFEFCD);
    lapiz.color = Colors.white;

    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 20;
    lapiz.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter, // Ajusta este valor
      colors: [Colors.black, Colors.white],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.61));

    final path = Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.42);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.61, size.width, size.height * 0.42);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
