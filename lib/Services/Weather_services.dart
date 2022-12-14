import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:weather_app/model/Weather_Model.dart';
class WeatherServices{

  Future<WeatherModel>getWeather ({required String CityName}) async {

    String baseUrl = 'http://api.weatherapi.com/v1';
    String AppKey = 'f273986d8c4e460c8ca134933220412';
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$AppKey&q=$CityName&days=7');

    http.Response response =  await  http.get(url);
    Map <String,dynamic> data = jsonDecode(response.body);
    print(data);

    WeatherModel Weather = WeatherModel.fromJson(data);
    return Weather;


  }
}