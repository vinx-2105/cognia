import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ShowLocation extends StatelessWidget {

  Map dataRecv = {};
  Placemark placemark;

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Position', style: headingStyle),
                  Text('Latitute  : ${placemark.position.latitude}', style: textStyle),
                  Text('Longitute : ${placemark.position.longitude}', style: textStyle),
                ],
              ),
            ),
            Card(
              color: Colors.grey[200],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Address', style: headingStyle),
                    Text('Name : ${placemark.name}', style: textStyle),
                    Text('ThroughFare : ${placemark.thoroughfare}', style: textStyle),
                    Text('Sub Locality : ${placemark.subLocality}', style: textStyle),
                    Text('Locality : ${placemark.locality}', style: textStyle),
                    Text('Postal Code : ${placemark.postalCode}', style: textStyle),
                    Text('Country : ${placemark.country}', style: textStyle),
                  ],
                )
            ),
            FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/map', arguments: {'placemark': placemark});},
                child: Text("Show on Map"),
                color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}