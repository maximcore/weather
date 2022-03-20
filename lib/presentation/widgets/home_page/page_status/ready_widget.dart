import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_bloc.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_state.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_bloc.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';
import 'package:weather/presentation/widgets/home_page/current_weather.dart';
import 'package:weather/presentation/widgets/home_page/day_weather.dart';
import 'package:weather/presentation/widgets/home_page/todays_weather.dart';

class ReadyWidget extends StatelessWidget {
  const ReadyWidget({
    Key? key,
    required this.localizationState,
    required this.state,
    required this.connectivityState,
  }) : super(key: key);

  final LocalizationState localizationState;
  final CurrentCityState state;
  final ConnectivityState connectivityState;

  @override
  Widget build(BuildContext context) {
    String address = '';
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: Column(
          children: [
            // connectivityState.status == ConnectivityStatus.connected
            //     ? const Icon(Icons.wifi)
            //     : const Icon(Icons.wifi_off),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: state.weather?.name,
                    ),
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final status = context.read<ConnectivityBloc>().state.status;
                    final geoCode = GeoCode();
                    Coordinates coordinates = await geoCode.forwardGeocoding(address: address);
                    context.read<CurrentCityBloc>().fetchCityWeatherByCoordinates(
                          lat: coordinates.latitude ?? 0,
                          lon: coordinates.longitude ?? 0,
                          status: status,
                        );
                  },
                ),
                TextButton(
                  child: Text(localizationState.status.name),
                  onPressed: () {
                    context.read<LocalizationBloc>().switchLocale();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    final status = context.read<ConnectivityBloc>().state.status;
                    final location = Location();
                    context.read<CurrentCityBloc>().fetchCityWeather(
                          location: location,
                          status: status,
                        );
                  },
                )
              ],
            ),
            CurrentWeather(weatherEntity: state.weather!),
            const Divider(),
            SizedBox(
              height: 96,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TodaysWeather(
                    todaysWeatherEntity: state.todaysWeather![index],
                  );
                },
                itemCount: state.todaysWeather!.length,
              ),
            ),
            const Divider(),
            ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return DayWeather(
                  weather: state.weekWeather![index],
                );
              },
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
