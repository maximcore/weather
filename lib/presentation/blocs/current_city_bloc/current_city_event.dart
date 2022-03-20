import 'package:location/location.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';

abstract class CurrentCityEvent {}

class LoadingEvent extends CurrentCityEvent {}

class FetchDataEvent extends CurrentCityEvent {
  FetchDataEvent({
    required this.location,
    required this.status,
  });

  final Location location;
  final ConnectivityStatus status;
}

class FetchDataByCoordinatesEvent extends CurrentCityEvent {
  FetchDataByCoordinatesEvent({
    required this.lat,
    required this.lon,
    required this.status,
  });

  final num lat;
  final num lon;
  final ConnectivityStatus status;
}
