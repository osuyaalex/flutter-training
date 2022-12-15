import 'package:flutter/material.dart';

Widget movieImage( String imageUrl){
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: NetworkImage(imageUrl,),
        fit: BoxFit.fill,
        
      )
    ),
  );
}