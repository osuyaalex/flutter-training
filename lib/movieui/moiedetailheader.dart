import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';

class MovieDetailHeader extends StatelessWidget {
  const MovieDetailHeader(this.movie,{Key? key}) : super(key: key);
 final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${movie.year}. ${movie.genre}'.toUpperCase(), style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.cyanAccent,
        ),),
        Text('${movie.title}', style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32,

        ),),
        Text.rich(TextSpan(style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey
        ),
          children: <TextSpan> [
            TextSpan(
              text: movie.plot,
            ),
            TextSpan(
              text: 'more...',
              style: TextStyle(
                color: Colors.blueAccent
              )
            )
          ]
        ))
      ],
    );
  }
}
