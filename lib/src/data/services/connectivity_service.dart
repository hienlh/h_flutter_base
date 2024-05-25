part of 'services.dart';

class ConnectivityService extends GetxService implements IConnectivity {
  @override
  Future<bool> checkConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.none);
  }
}
