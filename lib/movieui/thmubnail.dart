import 'package:flutter/material.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  const MovieDetailsThumbnail(this.thumbnail,{Key? key}) : super(key: key);
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Icon(Icons.play_circle_outlined,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),    //what is happening in the bracket is another way of coding colors (we could also use colors.)

          ),
          height: 80,
        )
      ],
    );
  }
}
