

import 'package:flutter/material.dart';
import 'package:flutter_newwww/model/moviee.dart';
import 'package:flutter_newwww/pages/moviedetails.dart';
import 'package:flutter_newwww/movieui/moviecard.dart';
import 'package:flutter_newwww/movieui/movieimage.dart';

class MovieListView extends StatefulWidget {
 const  MovieListView({ Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {

  final List<Movie>movieList = Movie.getMovies();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
          return Stack(
            children: [
              movieCard(movieList[index], context),
              Positioned(
                   top: 10.0,
                  child: movieImage(movieList[index].images[0])),

            ],
          );
        // return Card(
        //   elevation: 4.5,      //to put a shadow around your card
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       backgroundColor: Colors.blueGrey.shade700,
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(image: NetworkImage(movieList[index].images[0]),
        //               fit: BoxFit.cover,
        //           ),
        //           color: Colors.blueGrey.shade700,
        //           borderRadius: BorderRadius.circular(19)
        //         ),
        //         child: Text(''),
        //       ),
        //     ),
        //     trailing: Text('...'),
        //     title: Text(movieList[index].title), //this.....
        //     subtitle: Text(movieList[index].rated),
        //     onTap: (){
        //      // debugPrint('Movie Name: ${movies.elementAt(index)}');  //.....and this are basically the same
        //       Navigator.push(context, MaterialPageRoute(
        //           builder: (context) => MovieListViewDetails(movieName: movieList[index].title,movie: movieList[index],)
        //
        //       ));
        //     },
        //
        //   ),
        // );
      }
      ),
    );
  }
}
