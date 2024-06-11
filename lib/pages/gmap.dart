import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap extends StatefulWidget {
  State<MyGoogleMap> createState() => googleMapState();
}

class googleMapState extends State<MyGoogleMap> {
  late Position loc;
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    loc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print("location:${loc.latitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GoogleMap"),
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(10, 20),
          ),
          markers: {
            Marker(
                markerId: MarkerId("Starting_pt"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(10, 20)),
          }),
    );
  }
}
