import 'package:flutter/material.dart';
import 'package:flutter_newwww/weather/util/forcastcard.dart';

import '../modell/weatherforcastmodel.dart';

class BottomView extends StatelessWidget {
  const BottomView(this.snapshot, {Key? key}) : super(key: key);
   final AsyncSnapshot<WeatherForcastModel> snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
           Text('7-day weather forecast'.toUpperCase(),
             style: const TextStyle(
               fontSize: 14,
               color: Colors.black87,
             ),
           ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
            separatorBuilder: (context, index){
                return const SizedBox(width: 8,);
              },
              itemCount: snapshot.data?.weather?.length?? 0,

            itemBuilder: (context, index){
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width /2.7,
                  height: 160,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xff9661c3), Colors.white],
                      begin: Alignment.topLeft, end: Alignment.bottomRight
                    )
                  ),
                  child: ForcastCard(snapshot, index),

                ),
              );
            },
          ) ,
        ),
      ],
    );

  }
}
