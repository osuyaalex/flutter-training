import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {Key? key}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,

        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(movie.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// this can also be used in place of movieCard. you're just using movieCard to fulfill all righteousness

// same thing with movieImage and every other strange line of code we write