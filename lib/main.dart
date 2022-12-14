
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'Screens/Home_Page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context)
    {
    return WeatherProvider();
    },
    child: WeatherApp(),
  )
  );
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).WeatherData== null ? Colors.blue :Provider.of<WeatherProvider>(context).WeatherData!.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


