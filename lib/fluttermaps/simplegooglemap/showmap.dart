import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowSimpleMap extends StatefulWidget {
  const ShowSimpleMap({Key? key}) : super(key: key);

  @override
  State<ShowSimpleMap> createState() => _ShowSimpleMapState();
}

class _ShowSimpleMapState extends State<ShowSimpleMap> {
  late GoogleMapController mapController;
  static LatLng center = const LatLng(45.521563, -112.677433);


  void onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: GoogleMap(
        markers: {portlandMarker, Buckman},
        mapType: MapType.hybrid,
        onMapCreated: onMapCreated,
          initialCameraPosition:CameraPosition(target:
      center, zoom: 11.0,
      )
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: goToIntel, label: Text('intel coorp',
       ),
      icon:Icon(Icons.place) ,
      ),
    );
  }

  static final CameraPosition intelPosition = CameraPosition(target:LatLng(6.5869454,3.2746085),
  bearing: 191.789,
  tilt: 34.89,
  zoom: 19.780
  );

  Future<void> goToIntel() async{
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));
  }


  Marker portlandMarker = Marker(markerId: MarkerId('Portland'),
    position: center,
    infoWindow: const InfoWindow(
      title: 'Portland',
      snippet: 'this is cool'
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
  );

  Marker Buckman =  Marker(markerId: MarkerId('SA'),
    position:  LatLng(45.516653, -122.642736),
    infoWindow: InfoWindow(
      title: 'Buckman',
      snippet: 'Another one'
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );


}


