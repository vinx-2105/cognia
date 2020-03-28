import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CurrentLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void getCurrentLocation() async{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude,position.longitude);
      Navigator.pushReplacementNamed(context, '/showLocation', arguments: {'placemark': placemark[0]});

    }

    getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting User Location'),
      ),
      body: Container(
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 80.0,
        ),
      ),
    );
  }
}