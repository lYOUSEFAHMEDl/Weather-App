import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/Weather_Model.dart';

class WeatherProvider extends ChangeNotifier
{
WeatherModel? _WeatherData;
String? cityName;
set WeatherData(WeatherModel? Weather){
  _WeatherData = Weather ;
  notifyListeners();
}
WeatherModel? get WeatherData
{
  return _WeatherData;
}
}