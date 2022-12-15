import 'dart:convert';

import 'package:flutter_newwww/fluttermaps/simplegooglemap/quakesmapapp/model/earthquakemodel.dart';
import 'package:http/http.dart';

class Network{

  Future<EarthquakeModel> getEarthquake() async{
    var apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_hour.geojson';

   Response response = await get(Uri.parse(Uri.encodeFull(apiUrl)));

   if(response.statusCode == 200){
     print('Quake Data = ${response.body}');
     return EarthquakeModel.fromJson(json.decode(response.body));
   }else{
     throw('Error Getting EarthQuakes');
   }

  }
}