import 'dart:convert';

import 'package:flutter_newwww/weather/util/forcastutil.dart';
import 'package:http/http.dart';

import '../modell/weatherforcastmodel.dart';

class Network{
  Future<WeatherForcastModel> getWeatherForcast({required String cityName}) async {
    var finalUrl = 'https://api.openweathermap.org/data/2.5/weather?q='+cityName+'&appid='+Util.appId+'';

    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));

    print('URL: ${Uri.encodeFull(finalUrl)}');

    if(response.statusCode == 200){
      
      print('weather data: ${response.body}');
        return WeatherForcastModel.fromJson(json.decode(response.body));
        //by doing this, we get the actual mapped model (dart object)
    }else{
      throw Exception('Error getting weather forcast');
    }
  }
}
