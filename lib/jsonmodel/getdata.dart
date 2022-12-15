// this is overkill. but not really.

import 'package:flutter_newwww/jsonmodel/network.dart';

Future getData() async{
  Future data;
  String url = 'https://jsonplaceholder.typicode.com/posts';
  Network network = Network(url);

  data = network.fetchData();

 // data.then((value) => print(value[0]['title']));

  return data;
}