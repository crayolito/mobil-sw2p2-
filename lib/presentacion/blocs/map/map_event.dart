part of 'map_bloc.dart';

class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitialControllerMap extends MapEvent {
  final GoogleMapController controllerGoogleMap;
  const OnMapInitialControllerMap(this.controllerGoogleMap);
}

class OnChangedStatusFollowUser extends MapEvent {
  final bool statusFollow;
  const OnChangedStatusFollowUser(this.statusFollow);
}

class OnMapControllerCamera extends MapEvent {
  final CameraPosition cameraPosition;
  const OnMapControllerCamera(this.cameraPosition);
}

class OnClearFigureMap extends MapEvent {
  const OnClearFigureMap();
}

class OnResetState extends MapEvent {
  const OnResetState();
}

class OnInitFigureMap extends MapEvent {
  const OnInitFigureMap();
}