import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuildGoogleMap extends StatefulWidget {
  const BuildGoogleMap({Key? key}) : super(key: key);

  @override
  State<BuildGoogleMap> createState() => _BuildGoogleMapState();
}

class _BuildGoogleMapState extends State<BuildGoogleMap> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markerList = <Marker>[];
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(36.1083333, 117.8608333),
            zoom: 3
        ),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_markerList),
      ),
    );
  }
}
