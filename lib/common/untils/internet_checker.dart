import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  InternetChecker({required this.connectivity});

  final Connectivity connectivity;

  Future<bool> hasConnection() async {
    final connection = await connectivity.checkConnectivity();
    return connection != ConnectivityResult.none;
  }
}
