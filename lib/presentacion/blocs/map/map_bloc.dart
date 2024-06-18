import 'dart:ui' as ui;

import 'package:app_p2sw1/presentacion/features/alojamientos/domain/entities/alojamiento.dart';
import 'package:app_p2sw1/presentacion/features/alojamientos/infrastructure/repositories/alojamiento_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  int statusZoom = 0;
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  final alojamientoRepositoryImpl = AlojamientoRepositoryImpl();
  MapBloc() : super(MapState()) {
    on<OnChangedStatusFollowUser>((event, emit) {
      emit(state.copyWith(followUser: event.statusFollow));
    });
    on<OnMapInitialControllerMap>(_onInitialControllerMap);
    on<OnMapControllerCamera>(_onMapControllerCamera);
    on<OnResetState>((event, emit) {
      emit(MapState());
    });
    on<OnInitFigureMap>((event, emit) async {
      final iconMarker = await getNetworkImageMarker(
          'https://res.cloudinary.com/da9xsfose/image/upload/v1718169005/qqe9qcmmeyhgsys3saw1.png');
      Map<String, Marker> markers = {};
      try {
        final currentMarkers = Map<String, Marker>.from(state.markers);
        final response = await alojamientoRepositoryImpl.getAlojamientos();

        List<LatLng> getCoordenadasAlojamientos(
            List<Alojamiento> alojamientos) {
          return alojamientos.map((alojamiento) {
            final coords = alojamiento.ubicacionCoordenadas.split(',');
            final lat = double.parse(coords[0].trim());
            final lng = double.parse(coords[1].trim());
            return LatLng(lat, lng);
          }).toList();
        }

        final coordenadas = getCoordenadasAlojamientos(response);
        for (var i = 0; i < coordenadas.length; i++) {
          final markerId = 'marker$i';
          markers[markerId] = Marker(
            markerId: MarkerId(markerId),
            position: coordenadas[i],
            icon: iconMarker,
          );
        }
        currentMarkers.addAll(markers);
        emit(state.copyWith(
          markers: currentMarkers,
        ));
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Future<void> close() {
    add(const OnResetState());
    return super.close();
  }

  Future<void> _onInitialControllerMap(
      OnMapInitialControllerMap event, Emitter<MapState> emit) async {
    mapController = event.controllerGoogleMap;
    emit(state.copyWith(
      isMapInitialized: true,
    ));
  }

  Future<void> _onMapControllerCamera(event, emit) async {
    void moveCameraMyLocation(LatLng newLocation) {
      final cameraUpdate = CameraUpdate.newLatLngZoom(newLocation, 17.5);
      mapController!.animateCamera(cameraUpdate);
    }

    void reorientMap() {
      if (mapController != null && cameraPosition != null) {
        mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: cameraPosition!.target,
                zoom: cameraPosition!.zoom,
                bearing: 0)));
      }
    }
  }
}

Future<BitmapDescriptor> getNetworkImageMarker(String urlMarker) async {
  final resp = await Dio().get(
    urlMarker,
    options: Options(responseType: ResponseType.bytes),
  );

  final imageCodec = await ui.instantiateImageCodec(resp.data,
      targetHeight: 120, targetWidth: 120);
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}
