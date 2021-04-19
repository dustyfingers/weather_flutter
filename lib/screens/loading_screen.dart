import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weather_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = env['OPEN_WEATHER_MAP_API_KEY'];

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getWeatherData() async {
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Oakland&appid=$apiKey');
    http.Response res = await http.get(uri);
    print(res.body);
  }

  // initState gets called once when the widget renders
  @override
  void initState() {
    super.initState();
    // load environment variables
    dotenv.load();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getWeatherData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  // deactivate() gets called once the widget is 'destroyed'
}
