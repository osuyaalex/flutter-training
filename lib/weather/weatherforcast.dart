import 'package:flutter/material.dart';
import 'package:flutter_newwww/weather/network/network.dart';
import 'package:flutter_newwww/weather/util/bottomview.dart';
import 'package:flutter_newwww/weather/util/midview.dart';
import 'package:flutter_newwww/weather/util/textfieldview.dart';

import 'modell/weatherforcastmodel.dart';

class WeatherForcast extends StatefulWidget {
  const WeatherForcast({Key? key}) : super(key: key);

  @override
  State<WeatherForcast> createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {

  late Future<WeatherForcastModel> forcastObject;

  String cityName = 'Mumbai';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forcastObject = Network().getWeatherForcast(cityName: cityName);

    forcastObject.then((weather) {
        print(weather.weather?[0].main);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView(
       children: [

          TextFieldView(),
         Container(
           child: FutureBuilder<WeatherForcastModel>(                 // the type of future is not necessary, jst for clarity
             future: forcastObject,
             builder: (BuildContext context, AsyncSnapshot<WeatherForcastModel> snapshot) {
                   if(snapshot.hasData){
                      return Column(
                        children: [
                          MidView(snapshot: snapshot),
                          BottomView(snapshot),
                        ],
                      );
                   }else{
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
             }
             }
           ),
         )
       ],
     ),
    );
  }

  Widget TextFieldView() {
    return Container(
      child: TextField(
        decoration:InputDecoration(
          hintText: 'Enter City Name',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(8),

        ),
        onSubmitted: (value) {
          setState(() {
            cityName = value;
            forcastObject = Network().getWeatherForcast(cityName: cityName);
          });
        },
      ),
    );
  }
}
