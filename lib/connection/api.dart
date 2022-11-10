import 'connection_checker.dart';
import 'package:http/http.dart' as http;

//========================================================
// API FUNCTION FOR THIS PROJECT
//========================================================
class API {
  Future<String> query({
    required String query,
    required String dataMode,
    required String clientID,
  }) async {
    Map internetResult = await CheckNetworkStatus().check();
    http.Response result;
    String urlstring =
        "http://api.flexpda.com/api/values?Query=$query&ClientID=$clientID&DataMode=$dataMode&AllowedPlatforms=ANDROID"
            .replaceAll(" ", "+");

    if (!internetResult['status']) return internetResult['response'].toString();
    try {
      print(urlstring);
      result = await http.get(Uri.parse(urlstring));
      if (result.statusCode == 200) {
        return result.body;
      } else {
        return "Error: ${result.body}";
      }
    } catch (e) {
      return "ERROR: $e";
    }
  }
}


// datamode: GET SCHOOL CLIENT ID
// query: 