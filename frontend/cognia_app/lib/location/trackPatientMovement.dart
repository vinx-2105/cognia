import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import '../CREDS.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

class TrackPatientMovement extends StatefulWidget {
  @override
  _TrackPatientMovementState createState() => _TrackPatientMovementState();
}

class _TrackPatientMovementState extends State<TrackPatientMovement> {

  List<String> timestamps = [];
  List<String> latitudes = [];
  List<String> longitudes =[];

  Widget _widget = SpinKitFadingCube(
    color: Colors.blue,
    size: 80.0,
  );

  Future<String> fetchPatientLoc(BuildContext context) async {
    final http.Response response = await http.post(
      IP+'/api/locations/get_patients_location_history/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token  ' +AUTH_TOKEN,
      },
    );

    if(response.statusCode==200){
      print("Location history fetched");
      Map<String, dynamic> data = json.decode(response.body);
      print(data);
      dynamic entries = data.entries.elementAt(0).value;

      entries.forEach((entry) {
          timestamps.add(entry['timestamp']);
          latitudes.add(entry['latitude']);
          longitudes.add(entry['longitude']);
      });

      setState(() {
        _widget = ListView.separated(
          itemCount: latitudes.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: Icon(Icons.location_searching, color: Colors.redAccent[700],),
                title:
                Column(
                  children: <Widget>[
                    Text('Timestamp : ${timestamps[index]}'),
                    Text('Latitute  : ${latitudes[index]}'),
                    Text('Longitute : ${longitudes[index]}'),
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent[700],),
                onTap: () async{
                  List <Placemark> placemark = await Geolocator().placemarkFromCoordinates(double.parse(latitudes[index]), double.parse(longitudes[index]));
                  Navigator.pushNamed(context, '/map',arguments: {'placemark': placemark[0]});
                },
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        );
        });

      return 'Success';
    }
    else{
      throw Exception('Failed to fetch last location');
      }
    }

  @override
  void initState() {
    fetchPatientLoc(context);
    super.initState();
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Movement History'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: _widget,
    );
  }
}