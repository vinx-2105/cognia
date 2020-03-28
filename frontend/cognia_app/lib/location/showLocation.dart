import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ShowLocation extends StatelessWidget {

  Map dataRecv = {};
  Placemark placemark;

  RoundedRectangleBorder shape =  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: BorderSide(
        color: Colors.black,
        width: 2.0,
      )
  );

  TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  @override
  Widget build(BuildContext context) {

    dataRecv = ModalRoute.of(context).settings.arguments;
    placemark = dataRecv['placemark'];

    TextStyle headingStyle = TextStyle(
      fontWeight: FontWeight.w500,
      letterSpacing: 3,
      fontSize: 24,
    );

    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.w300,
      letterSpacing: 1.5,
      fontSize: 16,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Location Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              shape: shape,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('POSITION',style: headingStyle),
                    Row(
                      children: <Widget>[
                        Text('Latitute  : ', style: textStyle),
                        Text('${placemark.position.latitude}', style: textStyle),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Longitute : ', style: textStyle),
                        Text('${placemark.position.longitude}', style: textStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: shape,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('ADDRESS', style: headingStyle),
                      Text('Name : ${placemark.name}', style: textStyle),
                      Text('ThroughFare : ${placemark.thoroughfare}', style: textStyle),
                      Text('Sub Locality : ${placemark.subLocality}', style: textStyle),
                      Text('Locality : ${placemark.locality}', style: textStyle),
                      Text('Postal Code : ${placemark.postalCode}', style: textStyle),
                      Text('Country : ${placemark.country}', style: textStyle),
                    ],
                  ),
              )
            ),
            FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/map', arguments: {'placemark': placemark});},
                child: Text("Show on Map", style: textStyle,),
                shape: shape,
                color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}