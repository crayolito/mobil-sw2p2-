import 'package:animate_do/animate_do.dart';
import 'package:app_p2sw1/presentacion/blocs/map/map_bloc.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/presentation/screens/components/button-geoNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class GeoNavigationBar extends StatefulWidget {
  const GeoNavigationBar({super.key});

  @override
  State<GeoNavigationBar> createState() => _GeoNavigationBarState();
}

class _GeoNavigationBarState extends State<GeoNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return FadeInRight(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonGeoNB(
              onPressed: () {
                mapBloc.add(OnInitFigureMap());
              },
              iconP: FontAwesomeIcons.compass,
            ),
            ButtonGeoNB(
              onPressed: () async {},
              iconP: Icons.gps_fixed_outlined,
            ),
            ButtonGeoNB(
              onPressed: () {
                context.push("/list-state-form");
              },
              iconP: Icons.file_copy,
            ),
            ButtonGeoNB(
                onPressed: () {
                  context.pop();
                },
                iconP: Icons.arrow_back_ios_new)
          ],
        ),
      ),
    );
  }
}
