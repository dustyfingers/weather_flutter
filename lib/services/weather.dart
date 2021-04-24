import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

class WeatherModel {
  String _apiKey = env['OPEN_WEATHER_MAP_API_KEY'];
  String _openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper nwHelper = NetworkingHelper(
        '$_openWeatherMapUrl?lat=${location.lat}&lon=${location.long}&units=imperial&appid=$_apiKey');

    var weatherData = await nwHelper.getWeatherData();

    return weatherData;
  }

  Future<dynamic> getGivenCityWeather(String cityName) async {
    NetworkingHelper nwHelper = NetworkingHelper(
        '$_openWeatherMapUrl?q=$cityName&units=imperial&appid=$_apiKey');

    var weatherData = await nwHelper.getWeatherData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 85) {
      return 'It\'s 🍦 time';
    } else if (temp > 70) {
      return 'Time for shorts and 👕';
    } else if (temp < 40) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
