import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';
import 'package:flutter_newwww/movieui/horizontalline.dart';
import 'package:flutter_newwww/movieui/moviedetailcast.dart';
import 'package:flutter_newwww/movieui/moviedetailhwp.dart';
import 'package:flutter_newwww/movieui/movieextraposters.dart';
import 'package:flutter_newwww/movieui/thmubnail.dart';


class MovieListViewDetails extends StatelessWidget {
  const MovieListViewDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);     // depending on where you put the instance (movieName) it can either be a positional or named argument

  final Movie movieName;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade700,

      ),
      backgroundColor: Colors.blueGrey.shade700,
      body: ListView(
        children: [
          MovieDetailsThumbnail(movie.images[0]),


          MovieDetailHeaderWithPoster(movie),
          HorizontalLine(),
          MovieDetailCast(movie),

          HorizontalLine(),
          MovieDetailExtraPosters(movie.images)
        ],
      ),
      // body: Center(
      //   child: Container(
      //     color: Colors.blueGrey.shade700,
      //
      //     child: ElevatedButton(
      //         onPressed: (){
      //       Navigator.pop(context);
      //
      //     },
      //         child:Text(movie.director,
      //           style: TextStyle(
      //           color: Colors.blueGrey.shade700,
      //         ),)
      //     ),
      //   ),
      // ),
    );
  }
}
