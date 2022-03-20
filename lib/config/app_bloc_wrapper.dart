import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:weather/domain/repositories/connectivity_repositories/connectivity_repository.dart';
import 'package:weather/domain/repositories/weather_repositories/weather_repository.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_bloc.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_event.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_bloc.dart';

class AppBlocWrapper extends StatelessWidget {
  const AppBlocWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final weatherRepository = GetIt.instance.get<WeatherRepository>();
    final connectivityRepository = GetIt.instance.get<ConnectivityRepository>();
    final location = Location();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentCityBloc(
            repository: weatherRepository,
          )..add(
              FetchDataEvent(
                location: location,
                status: ConnectivityStatus.disconnected,
              ),
            ),
        ),
        BlocProvider(
          create: (_) => LocalizationBloc(),
        ),
        BlocProvider(
          create: (_) => ConnectivityBloc(
            repository: connectivityRepository,
          )..checkConnection(),
        ),
      ],
      child: child,
    );
  }
}
