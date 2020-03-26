import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ShowMap extends StatefulWidget {
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {

  Completer<GoogleMapController> _mapController = Completer();

  Map dataRecv = {};
  Placemark placemark;

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {

    dataRecv = ModalRoute.of(context).settings.arguments;
    placemark = dataRecv['placemark'];
    Set <Marker> markers = Set();
    markers.add(
      Marker(
          markerId: MarkerId('placemark'),
          position: LatLng(placemark.position.latitude, placemark.position.longitude),
          infoWindow: InfoWindow(title: 'Current location', snippet: '${placemark.name}, ${placemark.locality}, ${placemark.country}')
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(placemark.position.latitude, placemark.position.longitude),
          zoom: 12.0,
        ),
        markers: markers,
      )
    );
    }
}
