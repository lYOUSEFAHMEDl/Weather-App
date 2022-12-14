import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/Screens/Search_Page.dart';
import 'package:weather_app/model/Weather_Model.dart';
import '../main.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  WeatherModel? WeatherData;
  @override
  Widget build(BuildContext context) {

    WeatherData = Provider.of<WeatherProvider>(context,listen: true).WeatherData;
    return Scaffold(
      appBar: AppBar(

        actions: [
         Padding(
           padding: const EdgeInsets.only(right: 16),
           child: IconButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
             return   SearchPage();
             }
             ));
           },
               icon:Icon( Icons.search,
                 size: 40,
               ),
           ),
         )
        ],
          title:  Text('Weather Page',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),

          ),

      ),
      body: WeatherData == null ?

      Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('There is no weather 😔️ start',style: TextStyle(

            fontSize: 30
          ),),
          Text('Searching now 🔍',style: TextStyle(
              fontSize: 30
          ),)
        ],
      ):   Container(
        decoration: BoxDecoration(
          color: WeatherData!.getThemeColor(),
          gradient: LinearGradient(
            colors: [
              WeatherData!.getThemeColor(),
              WeatherData!.getThemeColor()[50]!,
              WeatherData!.getThemeColor()[100]!,
            ],
                begin: Alignment.topCenter,
                end:   Alignment.bottomCenter
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<WeatherProvider>(context).cityName!,

              style: TextStyle(
                  fontSize: 32,fontWeight: FontWeight.bold
              ),
            ),




            Text('updated at : ${WeatherData!.Date.toString()}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(WeatherData!.getImage()),
                Text(WeatherData!.Temp.toInt().toString(),style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                Column(
                  children: [
                    Text('Min Temp: ${WeatherData!.MinTemp.toInt()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text('Min Temp: ${WeatherData!.MaxTemp.toInt()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),

              ],
            ),
            SizedBox(height: 30,),
            Text(WeatherData!.WeatherStateName,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
