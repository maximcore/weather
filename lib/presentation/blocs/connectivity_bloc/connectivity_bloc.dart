import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/domain/repositories/connectivity_repositories/connectivity_repository.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_event.dart';
import 'package:weather/presentation/blocs/connectivity_bloc/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc({
    required this.repository,
  }) : super(
          ConnectivityState(
            status: ConnectivityStatus.disconnected,
          ),
        ) {
    on<CheckConnection>((event, emit) async {
      try {
        final isConnected = await repository.isConnected();
        isConnected
            ? emit(
                state.copyWith(
                  status: ConnectivityStatus.connected,
                ),
              )
            : emit(
                state.copyWith(
                  status: ConnectivityStatus.disconnected,
                ),
              );
      } catch (e) {
        log(e.toString());
      }
    });
  }

  final ConnectivityRepository repository;

  void checkConnection() => add(CheckConnection());
}
