import 'package:flutter/material.dart';

class GetImage extends StatelessWidget {
  const GetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),      // to basically make a circle
        border: Border.all(color: Colors.redAccent, width: 1.2 ),
        image: DecorationImage(image: NetworkImage('https://picsum.photos/200/300'), fit: BoxFit.cover ),


      ),
    );
  }
}
