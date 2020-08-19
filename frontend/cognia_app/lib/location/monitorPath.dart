import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'locationDefaults.dart' as defaults;
import 'package:intl/intl.dart';
import '../CREDS.dart';

class MonitorPath extends StatefulWidget {
  @override
  _MonitorPathState createState() => _MonitorPathState();
}

class _MonitorPathState extends State<MonitorPath> {

  List <Position> positionList = [];

  Geolocator geolocator = Geolocator();
  LocationOptions locationOptions = LocationOptions(
    accuracy: LocationAccuracy.high,
    distanceFilter: defaults.minDistMoved,
    timeInterval: defaults.minTimeInterval,
  );

  Future<String> postLastLoc(Position position) async {
    final http.Response response = await http.post(
      IP+'/api/locations/register_user_location/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token  ' +AUTH_TOKEN,
      },
      body: jsonEncode(<String, String>{
        'longitude': position.longitude.toString(),
        'latitude': position.latitude.toString(),
        'timestamp': new DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
      }),
    );

    if(response.statusCode==200){
      print('Last Location Updated');
    }
    else{
      print('Error: Last Location Not Updated');
    }
  }

  void monitorPath () async{
    geolocator.getPositionStream(locationOptions).listen( (Position position) {
      if(position == null){
        print('Unkonwn position');
      }else{
        setState(() {
          positionList.add(position);
          postLastLoc(position);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    monitorPath();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movement History'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: ListView.separated(
          itemCount: positionList.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: Icon(Icons.location_searching, color: Colors.redAccent[700],),
                title:
                  Column(
                    children: <Widget>[
                      Text('Latitute  : ${positionList[index].latitude}'),
                      Text('Longitute : ${positionList[index].longitude}'),
                      Text('Speed : ${positionList[index].speed}'),
                      Text('Accuracy  : ${positionList[index].accuracy}'),
                    ],
                  ),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent[700],),
                onTap: () async{
                  List <Placemark> placemark = await geolocator.placemarkFromPosition(positionList[index]);
                  Navigator.pushNamed(context, '/map',arguments: {'placemark': placemark[0]});
                },
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
      ),
    );
  }
}