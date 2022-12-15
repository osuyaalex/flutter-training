import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';
import 'package:flutter_newwww/pages/moviedetails.dart';

Widget movieCard(Movie movie, BuildContext context){
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(left: 80),
      width: MediaQuery.of(context).size.width,
      height: 120,

      child: Card(
        color: Colors.black45,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(movie.title, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white
                      ),),
                    ),
                    Text("Rating: ${movie.imdbRating} /10", style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Released: ${movie.released}', style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),),
                    Text(movie.runtime,style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),),
                    Text(movie.rated,style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),)
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => MovieListViewDetails(movieName: movie,movie:movie,)

                ));
    }
  );
}