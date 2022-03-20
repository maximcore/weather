import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_bloc.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
    Key? key,
    required this.localization,
  }) : super(key: key);

  final localization;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(localization.status.error),
          IconButton(
            icon: const Icon(Icons.update),
            onPressed: () {
              final status = context.read<ConnectivityBloc>().state.status;
              context.read<CurrentCityBloc>().fetchCityWeather(
                location: Location(),
                status: status,
              );
            },
          )
        ],
      ),
    );
  }
}