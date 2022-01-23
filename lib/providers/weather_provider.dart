import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/weather.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel _weather = WeatherModel();
  WeatherModel get weather{
    return _weather;
  }

  Future<WeatherModel?> fetchWeather() async{
    var url = Network().Server() + "/weather";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return null;
      }
      _weather = WeatherModel.fromJson(extractedData);
      print(weather.request!.unit);
      notifyListeners();
    }catch (error){
      print("Get Data Weather Error in : $error");
      rethrow;
    }
  }
}