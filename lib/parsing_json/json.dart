import 'package:flutter/material.dart';
import 'package:flutter_newwww/jsonmodel/getdata.dart';
import 'package:flutter_newwww/jsonmodel/network.dart';
import 'package:flutter_newwww/parsing_json/createlistview.dart';

class JsonParsing extends StatefulWidget {
  const JsonParsing({Key? key}) : super(key: key);

  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {

late Future data;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // data = Network('https://jsonplaceholder.typicode.com/posts').fetchData();  you can leave it like this or the one below (though its overkill tbh)
      data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsing Jsonnetwork'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
              builder: (context, AsyncSnapshot snapshot){                        //snapshot represents the content in getdata()
              if(snapshot.hasData){
                return CreateListView(snapshot.data,);
                //return Text(snapshot.data[2]['body']);
              }
              return const CircularProgressIndicator();

              }
          ),
        ),
      ),
    );
  }
}
