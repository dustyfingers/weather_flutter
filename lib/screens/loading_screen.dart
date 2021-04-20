import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

import 'package:weather_flutter/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper nwHelper = NetworkingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&units=imperial');

    var weatherData = await nwHelper.getWeatherData();

    // redirect to locatino screen
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
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
        child: SpinKitRing(color: Colors.white, size: 100.0),
      ),
    );
  }

  // deactivate() gets called once the widget is 'destroyed'
}
