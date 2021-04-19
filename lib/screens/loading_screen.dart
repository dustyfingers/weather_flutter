import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.00;
  double longitude = 0.00;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lat;
    longitude = location.long;

    NetworkingHelper nwHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude');

    // print(data);
    // double temp = decodedData['main']['temp'];
    // int condition = decodedData['weather'][0]['id'];
    // String cityName = decodedData['name'];
  }

  // initState gets called once when the widget renders
  @override
  void initState() {
    super.initState();
    // load environment variables
    dotenv.load();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  // deactivate() gets called once the widget is 'destroyed'
}
