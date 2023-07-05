import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get hasInternetConnection;

  Future<ConnectivityResult> get hasNetworkConnectivity;
}

final networkInfoProvider = Provider<INetworkInfo>(
  (ref) => NetworkInfo(
    InternetConnectionChecker(),
    Connectivity(),
  ),
);

class NetworkInfo implements INetworkInfo {
  NetworkInfo(this.networkConnectionChecker, this.connectivity);

  final InternetConnectionChecker networkConnectionChecker;
  final Connectivity connectivity;

  @override
  Future<bool> get hasInternetConnection =>
      networkConnectionChecker.hasConnection;

  @override
  Future<ConnectivityResult> get hasNetworkConnectivity =>
      connectivity.checkConnectivity();
}
