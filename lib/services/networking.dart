import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({@required this.api});

  final api;

  Future<Map> getWeather() async {
    http.Response weatherData = await http.get(Uri.parse(api));
    return (weatherData.statusCode == 200)
        ? jsonDecode(weatherData.body)
        : weatherData.statusCode;
  }
}
