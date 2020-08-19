import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'locationDefaults.dart' as defaults;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../CREDS.dart';

class ShowPatientLoc extends StatefulWidget {

  @override
  _ShowPatientLocState createState() => _ShowPatientLocState();
}

class _ShowPatientLocState extends State<ShowPatientLoc> {

  Geolocator geolocator = Geolocator();
  List<Placemark> placemarks  = [];
  List<String> timestamps = [];
  List<String> patientNames = [];
  List<String> latitudes = [];
  List<String> longitudes =[];

  Widget _widget = SpinKitFadingCube(
    color: Colors.blue,
    size: 80.0,
  );

  Future<String> fetchPatientLastLoc() async {
    final http.Response response = await http.post(
      IP+'/api/locations/get_patients_last_location/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token  ' +AUTH_TOKEN,
      },
    );

    if(response.statusCode==200){
      print("Last location fetched");
      Map<String, dynamic> data = json.decode(response.body);
      data.forEach((k,v) {
        Map<String, dynamic> pos = Map<String, dynamic>.from(v);
        patientNames.add(k);
        timestamps.add(pos['timestamp']);
        latitudes.add(pos['latitude']);
        longitudes.add(pos['longitude']);
      });

      List<Placemark> pks = await geolocator.placemarkFromCoordinates(double.parse(latitudes[0]),double.parse(longitudes[0]));
      placemarks.add(pks[0]);

      setState(() {
        _widget = Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(patientNames[0], style: TextStyle( fontSize: 22, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, letterSpacing: 2,color: Colors.black)),
                      Text(timestamps[0], style: TextStyle( fontSize: 16, color: Colors.black54)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Latitute', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].position.latitude}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Longitute', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].position.longitude}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Divider(thickness: 3, height: 25, color: Colors.black54, indent: 100, endIndent: 100,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Name', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].name}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('ThroughFare', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].thoroughfare}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Sub Locality', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].subLocality}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Locality', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].locality}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Postal Code', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].postalCode}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Country', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                      Text('${placemarks[0].country}', style: TextStyle( fontSize: 18, color: Colors.black)),
                    ]
                ),
                Divider(thickness: 3, height: 25, color: Colors.black54, indent: 20, endIndent: 20,),
              ],
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/map', arguments: {'placemark': placemarks[0]});
              },
              icon: Icon(Icons.location_searching, color: Colors.blueAccent[700],),
              label: Text('Show on Map', style: TextStyle(fontSize: 22, color: Colors.blueAccent[700],),),
            ),
          ],
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
    fetchPatientLastLoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Last Location'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0,40,20.0,20.0),
        width: MediaQuery.of(context).size.width,
        child: _widget,
      ),
    );
  }
}
