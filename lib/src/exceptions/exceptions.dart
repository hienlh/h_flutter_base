import 'package:get/get.dart';

class NoNetworkConnectionException implements Exception {
  @override
  String toString() => 'no_network_connection'.tr;
}
