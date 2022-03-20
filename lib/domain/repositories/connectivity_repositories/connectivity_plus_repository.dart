import 'package:weather/domain/repositories/connectivity_repositories/connectivity_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityPlusRepository implements ConnectivityRepository {
  ConnectivityPlusRepository._();

  static final ConnectivityPlusRepository _instance = ConnectivityPlusRepository._();

  static ConnectivityPlusRepository get instance => _instance;

  @override
  Future<bool> isConnected() async {
    bool isConnected = false;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    }
    return isConnected;
  }
}
