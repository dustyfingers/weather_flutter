import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    // create instance of location obj and call getLocation method on that obj
    Location location = Location();
    await location.getCurrentLocation();

    print(location.lat);
    print(location.long);
  }

  // initState gets called once when the widget renders
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  // deactivate() gets called once the widget is 'destroyed'
}
