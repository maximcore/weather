import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';

enum ConnectivityStatus {
  connected,
  disconnected,
}

@freezed
class ConnectivityState with _$ConnectivityState {
  factory ConnectivityState({
    required ConnectivityStatus status,
  }) = _ConnectivityState;
}
