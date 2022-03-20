import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/i18n/strings.g.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_bloc.dart';
import 'package:weather/presentation/blocs/current_city_bloc/current_city_state.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_bloc.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';
import 'package:weather/presentation/widgets/home_page/page_status/initial_widget.dart';
import 'package:weather/presentation/widgets/home_page/page_status/loading_widget.dart';
import 'package:weather/presentation/widgets/home_page/page_status/my_error_widget.dart';
import 'package:weather/presentation/widgets/home_page/page_status/ready_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, connectivityState) {
        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, localizationState) {
            var localization = AppLocale.ru.build();
            if (localizationState.status == LocalizationStatus.eng) {
              localization = AppLocale.en.build();
            }
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  actions: [
                    connectivityState.status == ConnectivityStatus.connected
                        ? const Icon(Icons.wifi)
                        : const Icon(Icons.wifi_off),
                    IconButton(
                      onPressed: () {
                        context.read<ConnectivityBloc>().checkConnection();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
                body: BlocBuilder<CurrentCityBloc, CurrentCityState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case CurrentCityStatus.initial:
                        return InitialWidget(localization: localization);
                      case CurrentCityStatus.loading:
                        return LoadingWidget(
                          localization: localization,
                        );
                      case CurrentCityStatus.ready:
                        return ReadyWidget(
                          localizationState: localizationState,
                          state: state,
                          connectivityState: connectivityState,
                        );
                      case CurrentCityStatus.error:
                        return MyErrorWidget(localization: localization);
                    }
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
