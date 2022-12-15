import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_newwww/fluttermaps/simplegooglemap/quakesmapapp/network/network.dart';
import 'package:flutter_newwww/fluttermaps/simplegooglemap/quakesmapapp/util/buildgooglemap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model/earthquakemodel.dart';

class QuakeApp extends StatefulWidget {
  const QuakeApp({Key? key}) : super(key: key);

  @override
  State<QuakeApp> createState() => _QuakeAppState();
}

class _QuakeAppState extends State<QuakeApp> {
  late Future<EarthquakeModel> quakeData;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markerList = <Marker>[];
  double zoom = 5.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quakeData = Network().getEarthquake();

    //quakeData.then((value) => print('place: ${value.features?[0].properties?.place}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:  [
            BuildGoogleMap(),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed:(){
                zoom--;
                minus(zoom);
              },
                  icon: Icon(FontAwesomeIcons.magnifyingGlassMinus)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Align(
              alignment: Alignment.topRight,
              child:IconButton(onPressed: (){
                zoom++;
                plus(zoom);
              },
                  icon:Icon(FontAwesomeIcons.magnifyingGlassPlus)
              ) ,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
          setState(() {
            _markerList.clear(); //its always good to clear the map in the beginning
            setState(() {
              quakeData.then((quake) => {
                quake.features?.forEach((element) {
                  _markerList.add(Marker(markerId: MarkerId(element.id??''),     // markerid, infowindow etc are all properties of Marker
                    infoWindow: InfoWindow(
                      title: element.properties?.mag?.toString(),
                    ),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
                    position: LatLng(element.geometry?.coordinates?[1]?? 0, element.geometry?.coordinates?[0]?? 0),
                    onTap: (){}
                  )
                  );
                })
              });
            });
          });
          },
          label: Text('Find Quakes')
      ),
    );
  }

  Future<void> minus(double zoom) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target:LatLng(40.712776, 74.005974) )
    )
    );
  }

  Future<void> plus(double zoom) async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target:LatLng(40.712776, 74.005974) )
    )
    );
  }
}

