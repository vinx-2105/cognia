import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import '../CREDS.dart';

class CurrentLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Future<String> postLastLoc(Placemark placemark) async {
      final http.Response response = await http.post(
        IP+'/api/locations/register_user_location/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token  ' +AUTH_TOKEN,
        },
        body: jsonEncode(<String, String>{
          'longitude': placemark.position.longitude.toString(),
          'latitude': placemark.position.latitude.toString(),
          'timestamp': new DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
        }),
      );

      if(response.statusCode==200){
        print('Last Location Updated');
        return 'Success';
      }
      else{
        print('Error: Last Location Not Updated');
        return 'Failure';
      }
    }

    void getCurrentLocation() async{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude,position.longitude);
      postLastLoc(placemark[0]);
      Navigator.pushReplacementNamed(context, '/map', arguments: {'placemark': placemark[0]});
    }

    getCurrentLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text('User Location'),
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