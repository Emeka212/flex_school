import 'connection_checker.dart';
import 'package:http/http.dart' as http;
import '../components/public_variables.dart';

//========================================================
// API FUNCTION FOR THIS PROJECT
//========================================================
class API {
  Future<String> query({
    String? query,
    String? dataMode,
    String? clientID,
  }) async {
    Map internetResult = await CheckNetworkStatus().check();
    http.Response result;
    String urlstring =
        "http://api.flexpda.com/api/values?Query=${query ?? 'a'}&ClientID=${clientID ?? PublicVariables.schoolDetails.getAt(0)!['ClientID']}&DataMode=$dataMode&AllowedPlatforms=ANDROID";
    if (!internetResult['status']) return internetResult['response'].toString();
    try {
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
