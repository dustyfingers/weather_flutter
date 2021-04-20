import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  final String url;

  NetworkingHelper(this.url);

  Future getWeatherData() async {
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(res.statusCode);
    }
  }
}
