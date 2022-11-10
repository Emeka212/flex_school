import "package:connectivity_plus/connectivity_plus.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";

//========================================================
// CHECK INTERNET CONNECTION TYPE
//========================================================
class CheckNetworkStatus {
  Future check() async {
    bool status = false;
    String response = "Error:";
    ConnectivityResult checkType = await (Connectivity().checkConnectivity());
    switch (checkType) {
      case ConnectivityResult.wifi:
        status = await InternetConnectionChecker().hasConnection;
        response += 'Mobile connection detected but no internet access';
        break;
      case ConnectivityResult.mobile:
        status = await InternetConnectionChecker().hasConnection;
        response += 'Mobile connection detected but no internet access';
        break;
      case ConnectivityResult.bluetooth:
        status = await InternetConnectionChecker().hasConnection;
        response += 'Mobile connection detected but no internet access';
        break;
      default:
        status = await InternetConnectionChecker().hasConnection;
        response +=
            'No internet connection detected, please put on your data or connect to a wifi';
    }
    return {"status": status, "response": response};
  }
}
