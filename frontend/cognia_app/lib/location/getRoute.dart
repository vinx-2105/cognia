import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GetRoute extends StatefulWidget {
  @override
  _GetRouteState createState() => _GetRouteState();
}

class _GetRouteState extends State<GetRoute> {

  final sourceField = TextEditingController();
  final destField = TextEditingController();

  Geolocator geolocator = Geolocator();

  Widget _childWidget;

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  RoundedRectangleBorder btnShape =  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.white,
        width: 3.0,
      )
  );

  void getRoute () async {
    List<Placemark> sourcePlacemark = await geolocator.placemarkFromAddress(sourceField.text);
    List<Placemark> destPlacemark = await geolocator.placemarkFromAddress(destField.text);

    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: LatLng(sourcePlacemark[0].position.longitude, sourcePlacemark[0].position.longitude),
        // icon: ,
    ));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin’'),
        position: LatLng(destPlacemark[0].position.latitude, destPlacemark[0].position.longitude),
        // icon: destinationIcon
    ));

    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCC2xndO0zmFRa8aklCldGTPmjDfOYRhVU",
        sourcePlacemark[0].position.latitude,
        sourcePlacemark[0].position.longitude,
        destPlacemark[0].position.latitude,
        destPlacemark[0].position.longitude
      );

    if(result.isNotEmpty){
      result.forEach((PointLatLng point){
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    Polyline polyline = Polyline(
        polylineId: PolylineId('srcDestRoute'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
    );

    _polylines.add(polyline);

    Navigator.pushNamed(context, '/plotRoute', arguments: {
      'markers': _markers,
      'polylines': _polylines,
    });
  }

  @override
  void initState() {
    super.initState();

    _childWidget = Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
                controller: sourceField,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Source Address',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                ),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextField(
              controller: destField,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Destination Address',
                hintStyle: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            FlatButton.icon(
              onPressed: () {
                getRoute();
                setState(() {
                  _childWidget = SpinKitFadingCube(
                    color: Colors.white,
                    size: 80.0,
                  );
                });
              },
              icon: Icon(Icons.directions),
              label: Text('Get Route', style: TextStyle(color: Colors.white, fontSize: 18),),
              shape: btnShape,
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Route'),
      ),
      body: Container(
          child: _childWidget
      ),
    );
  }
}
