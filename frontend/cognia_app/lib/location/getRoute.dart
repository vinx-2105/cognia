import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';
import 'locationDefaults.dart' as defaults;

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
        color: Colors.black,
        width: 3.0,
      )
  );

  void getRoute () async {
    List<Placemark> sourcePlacemark = null;
    if(sourceField.text == "Current Location"){
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      sourcePlacemark = await Geolocator().placemarkFromCoordinates(position.latitude,position.longitude);
    }
    else{
      sourcePlacemark = await geolocator.placemarkFromAddress(sourceField.text);
    }

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

    print(sourcePlacemark[0].position.latitude);
    print(sourcePlacemark[0].position.longitude);
    print(destPlacemark[0].position.latitude);
    print(destPlacemark[0].position.longitude);
    List<PointLatLng> result = [];
    try {
      result = await polylinePoints.getRouteBetweenCoordinates(
          "AIzaSyDhNd9rHWBNf-2j1ev3YROuccznXcV9FfA",
          sourcePlacemark[0].position.latitude,
          sourcePlacemark[0].position.longitude,
          destPlacemark[0].position.latitude,
          destPlacemark[0].position.longitude
      );
    }catch(e){
      print(">>>> ERROR : $e");
    }
    if(result.isNotEmpty){
      result.forEach((PointLatLng point){
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        
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
      });
    }else{
      Toast.show('Could not fetch route !', context);
    }
  }

  @override
  void initState() {
    super.initState();

    _childWidget = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/route_icon.png', scale: 4,),
            SizedBox(height: 25,),
            TextField(
                controller: sourceField,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Source Address',
                  hintStyle: TextStyle(fontSize: 22),
                  suffixIcon: IconButton(icon: Icon(Icons.location_on), onPressed: () {sourceField.text = "Current Location";})
                ),
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: destField,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Destination Address',
                hintStyle: TextStyle(fontSize: 22),
                  suffixIcon: IconButton(icon: Icon(Icons.home), onPressed: () {destField.text = defaults.homeAddress;})
              ),
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        FlatButton.icon(
          onPressed: () {
            getRoute();
            setState(() {
              _childWidget = SpinKitFadingCube(
                color: Colors.blue,
                size: 80.0,
              );
            });
          },
          icon: Icon(Icons.directions, color: Colors.blueAccent[700],),
          label: Text('Get Route', style: TextStyle(fontSize: 22, color: Colors.blueAccent[700],),),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Route'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(20.0,40,20.0,20.0),
          width: MediaQuery.of(context).size.width,
          child: _childWidget
      ),
    );
  }
}
