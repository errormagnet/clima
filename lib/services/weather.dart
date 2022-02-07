import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const weatherApiId = 'de7c359d45ec530e1d74239d37d57de2';
const openWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<Map> getCurrentWeather() async {
    Location location = Location();
    Position currentLocation = await location.getCurrentLocation();
    String api =
        '$openWeatherMapUrl?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&APPID=$weatherApiId&units=metric';

    NetworkHelper networkHelper = new NetworkHelper(api: api);
    return await networkHelper.getWeather();
  }

  Future<Map> getUserWeather(String userCity) async {
    String api =
        '$openWeatherMapUrl?q=$userCity&APPID=$weatherApiId&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(api: api);
    return await networkHelper.getWeather();
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
