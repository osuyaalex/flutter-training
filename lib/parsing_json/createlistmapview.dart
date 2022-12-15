import 'package:flutter/material.dart';

import '../jsonmodel/post.dart';

class CreateListMapView extends StatelessWidget {
  const CreateListMapView(this.data,{Key? key}) : super(key: key);
final List<Post> data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
        itemBuilder: (context, int index){
        return Column(
          children:   [
            Divider(height: 5,),
            ListTile(
              title: Text(data[index].title),
              subtitle: Text(data[index].body),
              leading: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 23,
                    child: Text(data[index].id.toString()),
                  )
                ],
              ),

            )
          ],
        );
        }
    );
  }
}
