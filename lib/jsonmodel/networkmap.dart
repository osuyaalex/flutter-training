import 'dart:convert';

import 'package:flutter_newwww/jsonmodel/postlist.dart';
import 'package:http/http.dart';

class NetworkMap{

  final String url;

  NetworkMap(this.url);

  Future<PostList> loadPosts() async{
      final response = await get(Uri.parse(Uri.encodeFull(url)));

      if(response.statusCode == 200){

        return PostList.fromJson(json.decode(response.body));
      }else{
        throw Exception('Failed to get Post List');
      }
  }
}