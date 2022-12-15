import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';
import 'package:flutter_newwww/movieui/moiedetailheader.dart';
import 'package:flutter_newwww/movieui/movieposter.dart';

class MovieDetailHeaderWithPoster extends StatelessWidget {
  const MovieDetailHeaderWithPoster(this.movie,{Key? key}) : super(key: key);
   final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Poster(poster: movie.images[0],),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: MovieDetailHeader(movie)
          ),
        ],

      ),
    );
  }
}
