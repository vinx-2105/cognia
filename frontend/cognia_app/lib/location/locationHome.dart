import 'package:flutter/material.dart';

class LocationHome extends StatelessWidget {

  TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Home'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: <Widget>[
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/setHome');},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home, size: 70, color: Colors.blueAccent[700],),
                  Text('Set Home', style: textStyle,),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/userLocation');},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.location_on, size: 70, color: Colors.blueAccent[700],),
                  Text('My Location', style: textStyle,),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/getRoute');},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.navigation, size: 70, color: Colors.blueAccent[700],),
                  Text('Get Route', style: textStyle,),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/monitorPath');},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error, size: 70, color: Colors.blueAccent[700],),
                  Text('Movement', style: textStyle,),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/alertCaretaker');},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error, size: 70, color: Colors.blueAccent[700],),
                  Text('Alert Caretaker', style: textStyle,),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/locationSetting');},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.settings, size: 70, color: Colors.blueAccent[700],),
                  Text('Settings', style: textStyle,),
                ],
              ),
              padding: EdgeInsets.all(5.0),
            ),
          ],
        ),
      ),
    );
  }
}

