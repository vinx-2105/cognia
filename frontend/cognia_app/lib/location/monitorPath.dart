import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MonitorPath extends StatefulWidget {
  @override
  _MonitorPathState createState() => _MonitorPathState();
}

class _MonitorPathState extends State<MonitorPath> {

  List <Position> positionList = [];

  Geolocator geolocator = Geolocator();
  LocationOptions locationOptions = LocationOptions(
    accuracy: LocationAccuracy.high,
    distanceFilter: 0,
    timeInterval: 5,
  );

  void monitorPath () async{
    geolocator.getPositionStream(locationOptions).listen( (Position position) {
      if(position == null){
        print('Unkonwn position');
      }else{
        setState(() {
          positionList.add(position);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    monitorPath();

    return Scaffold(
      appBar: AppBar(
        title: Text('Monitor Path'),
      ),
      body: ListView.separated(
          itemCount: positionList.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title:
                  Column(
                    children: <Widget>[
                      Text('Latitute  : ${positionList[index].latitude}'),
                      Text('Longitute : ${positionList[index].longitude}'),
                      Text('Speed : ${positionList[index].speed}'),
                      Text('Accuracy  : ${positionList[index].accuracy}'),
                    ],
                  ),
                trailing: Icon(Icons.arrow_right),
                onTap: () async{
                  List <Placemark> placemark = await geolocator.placemarkFromPosition(positionList[index]);
                  Navigator.pushNamed(context, '/showLocation',arguments: {'placemark': placemark[0]});
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
