import 'package:flutter/material.dart';
import 'package:flutter_newwww/weather/util/convert_icon.dart';
import 'package:flutter_newwww/weather/util/forcastutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../modell/weatherforcastmodel.dart';

Widget ForcastCard(AsyncSnapshot<WeatherForcastModel> snapshot, int index){
  var dayOfWeek = '';
  var fullDate = Util.getFormattedDate(
    DateTime.fromMillisecondsSinceEpoch(snapshot.data?.dt ?? 0 * 1000)
        /* in the api used in the lesson, there is a list of various objects
        and in each object, there is a dt map, what we do in this particular
        section is t0 try to call and display each dt but since our api doesnt
        have a list, it would be impossible to follow up.
        so to put it exactly into context, in the video its;
        DateTime.fromMillisecondsSinceEpoch(snapshot.data.list[index].dt).
        the index being there so that when we call the daysofweek below, it would
        display all dt in the list in our code
         */
  );
  dayOfWeek = fullDate.split(',')[0];
  // so .split basically splits the date in the api according to its comma [Tue],[Jan 20], [1970]
  // then with the [0], it goes and get the first item which is Tue
  return Column(
   mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: getWeatherDescriptions(weatherDescription: snapshot.data?.weather?[0].main, color: Colors.blue, size: 35),
              // if we had a list, we would have passed(snapshot.data.list[index].weather.main)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('${snapshot.data?.wind?.speed?.toStringAsFixed(1)}m/h'),
                    SizedBox(width: 10,),
                    Icon(FontAwesomeIcons.wind, color: Colors.white, size: 20,)
                  ],
                ),
                Row(
                  children: [
                    Text('Hum: ${snapshot.data?.main?.humidity}%'),
                  ],
                ),
                Row(
                  children: [
                    Text('${snapshot.data?.main?.tempMax?.toStringAsFixed(0)}F'),
                    SizedBox(width: 10,),
                    Icon(FontAwesomeIcons.temperatureLow, color: Colors.white, size: 20,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ],
  );
}

//due to he fact that the api we used only has one dt we wont be able to finish
// this particular lesson

