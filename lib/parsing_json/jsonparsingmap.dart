import 'package:flutter/material.dart';
import 'package:flutter_newwww/jsonmodel/networkmap.dart';
import 'package:flutter_newwww/jsonmodel/post.dart';
import 'package:flutter_newwww/parsing_json/createlistmapview.dart';

import '../jsonmodel/postlist.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  State<JsonParsingMap> createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {

  late Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkMap networkMap = NetworkMap('https://jsonplaceholder.typicode.com/posts');
    data = networkMap.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JsonParsingMap'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot){       //the Asyncsnapshot isn't really needed. its just for clarification
            List<Post> allPosts;
            if(snapshot.hasData){
              allPosts = snapshot.data!.posts;
              return CreateListMapView(allPosts);
           //  Text(allPosts[0].title);
        }else{
           return CircularProgressIndicator();
    }

    },
        ),
      ),
    )
    );
  }
}
