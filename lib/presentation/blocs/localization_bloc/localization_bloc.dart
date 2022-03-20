import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_event.dart';
import 'package:weather/presentation/blocs/localization_bloc/localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc()
      : super(
          LocalizationState(
            status: LocalizationStatus.ru,
          ),
        ) {
    on<SwitchLocale>((event, emit) {
      if (state.status == LocalizationStatus.ru) {
        emit(
          state.copyWith(status: LocalizationStatus.eng),
        );
      } else {
        emit(
          state.copyWith(status: LocalizationStatus.ru),
        );
      }
    });
  }

  void switchLocale() => add(SwitchLocale());
}
