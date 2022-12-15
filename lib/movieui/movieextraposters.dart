import 'package:flutter/material.dart';

class MovieDetailExtraPosters extends StatelessWidget {
  const MovieDetailExtraPosters(this.posters,{Key? key}) : super(key: key);
  final List<String> posters;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('More Movie posters'.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.black26
          ),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index){
              return SizedBox(
                width: 8,
              );
              },
              itemCount: posters.length,
            itemBuilder: (context, index){
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width/4,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
