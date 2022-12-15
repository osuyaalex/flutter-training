import 'package:flutter/material.dart';

class CreateListView extends StatelessWidget {
  const CreateListView(this.data, {Key? key}) : super(key: key);
  final List data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
        itemBuilder: (context, int index){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text('${data[index]['title']}'),
            subtitle: Text('${data[index]['body']}'),
            leading: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 23,
                  child: Text('${data[index]['id']}'),
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
