import 'connection_checker.dart';

//========================================================
// API FUNCTION FOR THIS PROJECT
//========================================================
class API {
  Future<String> query({required String query}) async {
    Map internetResult = await CheckNetworkStatus().check();
    if (internetResult['status'] == true) {
      return internetResult.toString();
    } else {
      return internetResult.toString();
    }
  }
}
