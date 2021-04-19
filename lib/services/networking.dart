import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  final String _apiKey = env['OPEN_WEATHER_MAP_API_KEY'];
  final String url;

  NetworkingHelper(this.url);

  Future getWeatherData() async {
    Uri uri = Uri.parse('$url&appid=$_apiKey');
    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
    } else {
      print(res.statusCode);
    }
  }
}
