import 'package:flutter/material.dart';
import 'package:flutter_newwww/weather/util/convert_icon.dart';
import 'package:flutter_newwww/weather/util/forcastutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../modell/weatherforcastmodel.dart';
class MidView extends StatelessWidget {
   MidView({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<WeatherForcastModel> snapshot;


  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${snapshot.data?.name}, ${snapshot.data?.sys?.country}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black26,

              ),
            ),
            Text('${Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(snapshot.data?.dt?? 0))}',
              style: const TextStyle(
                fontSize: 18,
              )
            ),
            SizedBox( height: 12,),
            getWeatherDescriptions(weatherDescription: snapshot.data?.weather?[0].main, color: Colors.blue, size: 195),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${snapshot.data?.main?.temp?.toStringAsFixed(0)}F',     //because temp is a double
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text('${snapshot.data?.weather?[0].description?.toUpperCase()}')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('${snapshot.data?.wind?.speed?.toStringAsFixed(1)} m/h'),
                      Icon(FontAwesomeIcons.wind, color: Colors.brown,)

                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Text('${snapshot.data?.main?.humidity} %'),

                      Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, color: Colors.brown,)
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Text('${snapshot.data?.main?.tempMax?.toStringAsFixed(0)}F'),
                      Icon(FontAwesomeIcons.temperatureLow, color: Colors.brown,)
                    ],
                  )
                ],
              ),
            ),






          ],
        ),
      ),
    );
  }
}
