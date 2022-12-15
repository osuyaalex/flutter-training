import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';
import 'package:flutter_newwww/movieui/moviefield.dart';

class MovieDetailCast extends StatelessWidget {
  const MovieDetailCast(this.movie,{Key? key}) : super(key: key);
 final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField('cast', movie.actor),
          MovieField('Directors', movie.director)
        ],
      ),
    );
  }
}
