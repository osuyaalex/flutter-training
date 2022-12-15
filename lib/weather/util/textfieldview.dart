// import 'package:flutter/material.dart';
// import 'package:flutter_newwww/weather/modell/weatherforcastmodel.dart';
// import 'package:flutter_newwww/weather/network/network.dart';
//
// class TextFieldView extends StatefulWidget {
//    TextFieldView({required this.cityName,required this.forcastObject,Key? key}) : super(key: key);
//
//    final String cityName;
//   late Future<WeatherForcastModel>forcastObject;
//   @override
//   State<TextFieldView> createState() => _TextFieldViewState();
// }
//
// class _TextFieldViewState extends State<TextFieldView> {
//
//   late String cityName;
//   late Future forcastObject;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextField(
//         decoration:InputDecoration(
//           hintText: 'Enter City Name',
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           contentPadding: EdgeInsets.all(8),
//
//         ),
//         onSubmitted: (value) {
//         setState(() {
//           cityName = value;
//           forcastObject = Network().getWeatherForcast(cityName: cityName);
//         });
//         },
//       ),
//     );
//   }
// }
// if you are dealing with api and stateful widgets, unless absolutely necessary
// it is better to keep all the codes on one dart file and not split it
// it makes the whole thing easier

