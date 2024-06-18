import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/config/paleta-colores.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamiento.dart';
import 'package:app_p2sw1/presentacion/features/home/presentation/screen/components/textFromCustom-auth.dart';
import 'package:app_p2sw1/presentacion/shared/components/IconButtonCustom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPointScreen extends StatelessWidget {
  const SearchPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var decoration = BoxDecoration(
      image: DecorationImage(
        image: const NetworkImage(
            "https://i.pinimg.com/564x/96/97/83/969783e5b8518f14d89fb8216147416d.jpg"),
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        fit: BoxFit.cover,
      ),
    );

    return Scaffold(
      floatingActionButton: IconButtonCustom(
          onPressed: () {
            context.pop();
          },
          icon: Icons.arrow_back,
          heroTag: "salir0011"),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: decoration,
        child: SingleChildScrollView(
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
                        alignment: Alignment.bottomCenter,
                        height: size.height * 0.09,
                        width: size.width * 0.81,
                        child: CustomTextFormField(
                          placeholder: "Buscar Alojamiento",
                          icon: Icons.search,
                          color: Colors.white,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
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
                      ...alojamientosDataAuxliar.map((alojamiento) {
                        return Container(
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
                                padding: EdgeInsets.all(size.width * 0.015),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor.withOpacity(0.3),
                                ),
                                child: const Icon(
                                  size: 40,
                                  Icons.location_on,
                                  color: Colors.black,
                                  shadows: shadowPPN3,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: size.width * 0.03,
                                ),
                                height: size.height * 0.1,
                                width: size.width * 0.61,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      alojamiento.ubicacionDescriptiva,
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
                                      alojamiento.nombreAlojamiento,
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
                                  icon: const Icon(
                                    FontAwesomeIcons.route,
                                    color: Colors.black,
                                    size: 30,
                                    shadows: shadowPP,
                                  ))
                            ],
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
