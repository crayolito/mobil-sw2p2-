import 'package:app_p2sw1/presentacion/blocs/map/map_bloc.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/data/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewCustom extends StatefulWidget {
  final LatLng initialLocation;
  final Set<Polygon> polygons;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  const MapViewCustom({
    super.key,
    required this.initialLocation,
    required this.polygons,
    required this.markers,
    required this.polylines,
  });

  @override
  State<MapViewCustom> createState() => _MapViewState();
}

class _MapViewState extends State<MapViewCustom> {
  MapBloc? mapBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapBloc = BlocProvider.of<MapBloc>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowDialogCustom.showLoadingMessage(context);
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Navigator.pop(context));
    });
  }

  @override
  void dispose() {
    mapBloc!.add(const OnResetState());
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final CameraPosition initialCameraPosition =
        CameraPosition(target: widget.initialLocation, zoom: 17);
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: false);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (pointerMoveEvent) {
          mapBloc.add(const OnChangedStatusFollowUser(false));
        },
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          onMapCreated: (GoogleMapController controller) =>
              mapBloc.add(OnMapInitialControllerMap(controller)),
          onCameraMove: (CameraPosition cameraPosition) =>
              mapBloc.add(OnMapControllerCamera(cameraPosition)),
          // TODO: Markers
          markers: widget.markers,
          // TODO: Polygons
          polygons: widget.polygons,
          // TODO: Polylines
          polylines: widget.polylines,
        ),
      ),
    );
  }
}
