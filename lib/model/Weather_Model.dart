import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class WeatherModel {
   String Date;
   double Temp;
   double MaxTemp;
   double MinTemp;
   String WeatherStateName;
  // Icon   icon;

  WeatherModel({
    required this.Date,
    required this.Temp,
    required this.MaxTemp,
    required this.MinTemp,
    required this.WeatherStateName,
    //required this.icon
  });

  factory WeatherModel.fromJson(dynamic data){
    var JsonData = data['forecast']['forecastday'][0]['day'];
       return WeatherModel(
           Date: data['location']['localtime'] ,
           Temp: JsonData['avgtemp_c'],
           MaxTemp: JsonData['maxtemp_c'],
           MinTemp: JsonData['mintemp_c'],
           WeatherStateName: JsonData['condition']['text'],
       //    icon: data['current']['condition']['icon']
       );
  }
   @override
   String toString() {
     return 'tem = $Temp  minTemp = $MinTemp  date = $Date WeatherStateName = $WeatherStateName';
   }

   String getImage() {
     if (WeatherStateName == 'Sunny' || WeatherStateName == 'Clear' ||  WeatherStateName == 'partly cloudy')
     {
       return 'assets/images/clear.png';
     }
     else if (WeatherStateName == 'Blizzard' ||  WeatherStateName == 'Patchy snow possible'  ||  WeatherStateName == 'Patchy sleet possible' || WeatherStateName == 'Patchy freezing drizzle possible' || WeatherStateName == 'Blowing snow')
     {
       return 'assets/images/snow.png';
     }
     else if (WeatherStateName == 'Freezing fog' || WeatherStateName == 'Fog' ||  WeatherStateName == 'Cloudy' || WeatherStateName == 'Mist' || WeatherStateName == 'Fog')
     {
       return 'assets/images/cloudy.png';
     } else if (WeatherStateName == 'Patchy rain possible' ||
         WeatherStateName == 'Heavy Rain' ||
         WeatherStateName == 'Showers	') {
       return 'assets/images/rainy.png';
     } else if (WeatherStateName == 'Thundery outbreaks possible' || WeatherStateName == 'Moderate or heavy snow with thunder' || WeatherStateName == 'Patchy light snow with thunder'|| WeatherStateName == 'Moderate or heavy rain with thunder' || WeatherStateName == 'Patchy light rain with thunder' ) {
       return 'assets/images/thunderstorm.png';
     } else {
       return 'assets/images/clear.png';
     }
   }
   MaterialColor getThemeColor() {
     if (WeatherStateName == 'Sunny' || WeatherStateName == 'Clear' ||  WeatherStateName == 'partly cloudy') {
       return Colors.orange;
     } else if (

     WeatherStateName == 'Blizzard' ||  WeatherStateName == 'Patchy snow possible'  ||  WeatherStateName == 'Patchy sleet possible' || WeatherStateName == 'Patchy freezing drizzle possible' || WeatherStateName == 'Blowing snow') {
       return Colors.blue;
     } else if (WeatherStateName == 'Freezing fog' || WeatherStateName == 'Fog' ||  WeatherStateName == 'Heavy Cloud' || WeatherStateName == 'Mist' || WeatherStateName == 'Fog') {
       return Colors.blueGrey;
     } else if (WeatherStateName == 'Patchy rain possible' ||
         WeatherStateName == 'Heavy Rain' ||
         WeatherStateName == 'Showers	') {
       return Colors.blue;
     } else if (WeatherStateName == 'Thundery outbreaks possible' || WeatherStateName == 'Moderate or heavy snow with thunder' || WeatherStateName == 'Patchy light snow with thunder'|| WeatherStateName == 'Moderate or heavy rain with thunder' || WeatherStateName == 'Patchy light rain with thunder' ) {
       return Colors.deepPurple;
     } else {
       return Colors.orange;
     }
   }


}

