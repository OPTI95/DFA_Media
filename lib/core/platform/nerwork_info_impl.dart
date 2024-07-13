import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_info.dart';

class INetworkInfo implements NetworkInfo{
   final InternetConnectionChecker connectionChecker;

  INetworkInfo(this.connectionChecker);
  @override
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;

}