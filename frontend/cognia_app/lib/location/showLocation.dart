import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ShowLocation extends StatelessWidget {

  Map dataRecv = {};
  Placemark placemark;

  RoundedRectangleBorder shape =  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
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

  RoundedRectangleBorder btnShape =  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.black,
        width: 3.0,
      )
  );

  TextStyle btnTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {

    dataRecv = ModalRoute.of(context).settings.arguments;
    placemark = dataRecv['placemark'];

    TextStyle headingStyle = TextStyle(
      fontWeight: FontWeight.w600,
      letterSpacing: 3,
      fontSize: 24,
      color: Colors.black,
    );

    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      fontSize: 18,
      color: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Location Information'),
      ),
      body: Container(
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
                    Center(child: Text('POSITION',style: headingStyle)),
                    Text('Latitute  : ${placemark.position.latitude}', style: textStyle),
                    Text('Longitute : ${placemark.position.longitude}', style: textStyle),
                    Center(child: Text('ADDRESS', style: headingStyle)),
                    Text('Name : ${placemark.name}', style: textStyle),
                    Text('ThroughFare : ${placemark.thoroughfare}', style: textStyle),
                    Text('Sub Locality : ${placemark.subLocality}', style: textStyle),
                    Text('Locality : ${placemark.locality}', style: textStyle),
                    Text('Postal Code : ${placemark.postalCode}', style: textStyle),
                    Text('Country : ${placemark.country}', style: textStyle),
                  ],
                ),
              ),
            ),
            FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/map', arguments: {'placemark': placemark});},
                child: Text("Show on Map", style: btnTextStyle,),
                shape: btnShape,
                padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}