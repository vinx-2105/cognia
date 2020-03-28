import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Locate extends StatefulWidget {
  @override
  _LocateState createState() => _LocateState();
}

class _LocateState extends State<Locate> {

  final searchFieldController = TextEditingController();
  Widget _child;

  RoundedRectangleBorder btnShape =  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.black,
        width: 3.0,
      )
  );

  @override
  void initState() {
    super.initState();

    _child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: searchFieldController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter address',
              hintStyle: TextStyle( fontSize: 18),
          ),
            style: TextStyle(fontSize: 18),
        ),
        FlatButton.icon(
          onPressed: () {
            getLocation();
            setState(() {
              _child = SpinKitFadingCube(
                color: Colors.blue,
                size: 80.0,
              );
            });
          },
          icon: Icon(Icons.search),
          label: Text('Search', style: TextStyle(fontSize: 18),),
          shape: btnShape,
        ),
      ],
    );
  }

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  void getLocation() async{
    List<Placemark> _placemark = await Geolocator().placemarkFromAddress(searchFieldController.text);
    Navigator.pushNamed(context, '/showLocation', arguments: {'placemark': _placemark[0]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locate Address'),
      ),
      body: Container(
          child: _child
        ),
      );
  }
}
