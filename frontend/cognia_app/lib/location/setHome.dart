import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SetHome extends StatelessWidget {

  final homeAddressField = TextEditingController();
  var homeAddress = "IIT Ropar";

  Geolocator geolocator = Geolocator();

  void showOnMap(context) async{
    List<Placemark> placemark = await geolocator.placemarkFromAddress(homeAddress);
    Navigator.pushNamed(context, '/map', arguments: {'placemark': placemark[0]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('SET HOME'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(20.0,40,20.0,20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/house_icon.png', scale: 3,),
                  SizedBox(height: 25,),
                  TextField(
                    controller: homeAddressField,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Home Address',
                      hintStyle: TextStyle(fontSize: 22),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      homeAddress = homeAddressField.text;
                    },
                    icon: Icon(Icons.save, color: Colors.blueAccent[700], size: 30,),
                    label: Text('Save', style: TextStyle(fontSize: 24, color: Colors.blueAccent[700]), ),
                  ),
                ],
              ),
              FlatButton.icon(
                onPressed: () {
                  showOnMap(context);
                },
                icon: Icon(Icons.location_searching, color: Colors.blueAccent[700],),
                label: Text('Show on Map', style: TextStyle(fontSize: 22, color: Colors.blueAccent[700],),),
              ),
            ],
          ),
      ),
    );
  }
}
