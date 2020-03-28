import 'package:flutter/material.dart';

class LocationHome extends StatelessWidget {

  RoundedRectangleBorder shape =  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide(
      color: Colors.black,
      width: 3.0,
      )
    );

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
        title: Text('LOCATION'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: FlatButton.icon(
                  onPressed: () {Navigator.pushNamed(context, '/setHome');},
                  icon: Icon(Icons.arrow_right),
                  label: Text('Set Home', style: textStyle,),
                  shape: shape,
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: FlatButton.icon(
                  onPressed: () {Navigator.pushNamed(context, '/userLocation');},
                  icon: Icon(Icons.arrow_right),
                  label: Text('Current Location', style: textStyle,),
                  shape: shape,
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: FlatButton.icon(
                  onPressed: () {Navigator.pushNamed(context, '/getRoute');},
                  icon: Icon(Icons.arrow_right),
                  label: Text('Get Route', style: textStyle,),
                  shape: shape,
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: FlatButton.icon(
                  onPressed: () {Navigator.pushNamed(context, '/monitorPath');},
                  icon: Icon(Icons.arrow_right),
                  label: Text('Monitor Path', style: textStyle,),
                  shape: shape,
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: FlatButton.icon(
                  onPressed: () {Navigator.pushNamed(context, '/locate');},
                  icon: Icon(Icons.arrow_right),
                  label: Text('Locate Address', style: textStyle,),
                  shape: shape,
                  padding: EdgeInsets.all(10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

