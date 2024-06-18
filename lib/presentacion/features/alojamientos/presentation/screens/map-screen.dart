import 'package:app_p2sw1/config/constants/constantes.dart';
import 'package:app_p2sw1/config/paleta-colores.dart';
import 'package:app_p2sw1/presentacion/blocs/formulario/formulario_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/location/location_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/map/map_bloc.dart';
import 'package:app_p2sw1/presentacion/blocs/notificaciones/notificaciones_bloc.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/components/geo-navigator.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/map-loading-screen.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/widgets/map-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenn extends StatefulWidget {
  const MapScreenn({super.key});

  @override
  State<MapScreenn> createState() => _MapScreennState();
}

class _MapScreennState extends State<MapScreenn> {
  late LocationBloc locationBloc;
  late MapBloc mapBloc;
  late NotificacionesBloc notificacionesBloc;
  late FormularioBloc formularioBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formularioBloc = BlocProvider.of<FormularioBloc>(context);
    notificacionesBloc = BlocProvider.of<NotificacionesBloc>(context);
    locationBloc = BlocProvider.of<LocationBloc>(context);
    mapBloc = BlocProvider.of<MapBloc>(context);
    locationBloc.startFollowingUser();
    notificacionesBloc.add(const OnLocalNotificacionMessage());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // NOTE : CUANDO SOLUCIONE TAKESHI DESCOMENTALO
      mapBloc.add(const OnInitFigureMap());
      formularioBloc.add(const OnGetFormularios());
      // Este código se ejecutará después de que el widget se haya construido completamente
      print('El widget se ha construido completamente');
    });
  }

  @override
  void dispose() {
    locationBloc.stopFolowwingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    LatLng? initLocation;

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        if (locationState.lastKnownLocation == null) {
          return const MapLoading();
        }
        initLocation = locationState.lastKnownLocation;
        return Scaffold(
          body: Stack(
            children: [
              BlocBuilder<MapBloc, MapState>(
                builder: (context, mapState) {
                  return MapViewCustom(
                    initialLocation: initLocation!,
                    polygons: mapState.polygons.values.toSet(),
                    markers: mapState.markers.values.toSet(),
                    polylines: mapState.polylines.values.toSet(),
                  );
                },
              ),
              const GeoNavigationBar(),
              Positioned(
                  top: size.height * 0.04,
                  left: size.width * 0.04,
                  child: const SideBarButton()),
            ],
          ),
        );
      },
    );
  }
}

class SideBarButton extends StatelessWidget {
  const SideBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        context.push("/search-point");
      },
      child: Container(
          alignment: Alignment.center,
          height: size.height * 0.07,
          width: size.width * 0.92,
          decoration: BoxDecoration(
            color: kTerciaryColor.withOpacity(0.85),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: kPrimaryColor.withOpacity(0.85),
              width: 2.8,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black,
                  shadows: shadowPPN3,
                  size: 35,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text("Buscar ...",
                    style: GoogleFonts.anta(
                      color: Colors.black,
                      fontSize: 30,
                    ))
              ],
            ),
          )),
    );
  }
}
