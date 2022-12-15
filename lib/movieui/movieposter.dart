import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  const Poster({Key? key, required this.poster}) : super(key: key);
  final String poster;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(                  //basically gives us more flexibility to create circular or rectangular objects
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(poster),
              fit: BoxFit.fill,
            )
          ) ,
        ),
      ),
    );
  }
}
