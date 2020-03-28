import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlotRoute extends StatefulWidget {
  @override
  _PlotRouteState createState() => _PlotRouteState();
}

class _PlotRouteState extends State<PlotRoute> {

  Completer<GoogleMapController> _mapController = Completer();

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};


  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {

    Map dataRecv = ModalRoute.of(context).settings.arguments;
    _markers = dataRecv['markers'];
    _polylines = dataRecv['polylines'];

    CameraPosition initialLocation = CameraPosition(
        zoom: 13,
        target: LatLng(42.7477863, -71.1699932),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Route'),
        ),
        body: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            markers: _markers,
            polylines: _polylines,
            mapType: MapType.normal,
            initialCameraPosition: initialLocation,
            onMapCreated: _onMapCreated
        )
    );
  }
}
