import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

enum LocalizationStatus {
  ru,
  eng,
}

@freezed
class LocalizationState with _$LocalizationState {
  factory LocalizationState({
    required LocalizationStatus status,
  }) = _LocalizationState;
}
