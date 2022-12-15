// this code is basically for fetching api. memorise


import 'dart:convert';

import 'package:http/http.dart';

class Network{
  final String url;

  Network(this.url);

  Future fetchData() async{
    print('$url');

    Response response = await get(Uri.parse(Uri.encodeFull(url)));

    if (response.statusCode == 200){

       //print(response.body);
      return json.decode(response.body);                                         //the api we are trying to get is a list. since 'body' in response.body is a string we cant  get any particular index/item we want. the json.decode converts it to a json which can very well act like a list. and as a side note, jso is the reason dart:convert is imported
    }else{
      print(response.statusCode);
    }
  }
}