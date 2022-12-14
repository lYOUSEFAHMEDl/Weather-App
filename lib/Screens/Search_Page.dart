import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/Services/Weather_services.dart';
import 'package:weather_app/model/Weather_Model.dart';
import '../main.dart';

class SearchPage extends StatefulWidget {



  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
String? CityName ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Search a city',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async{

              CityName = data;
              WeatherServices Services = WeatherServices();

              WeatherModel? Weather =
                                      await Services.getWeather(CityName: CityName!);

              Provider.of<WeatherProvider>(context,listen: false).WeatherData = Weather;

              Provider.of<WeatherProvider>(context,listen: false).cityName = CityName;

              Navigator.pop(context);

            },
             decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              label: Text('Search'),
              suffixIcon:Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(5),

              ),
              hintText: 'Enter City'
            ),
          ),
        ),
      ),
    );
  }
}

