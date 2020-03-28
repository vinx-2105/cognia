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
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/app_bg1.jpg'), fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/userLocation');},
                child: Text('Current Location', style: textStyle,),
                shape: shape,
              ),
              FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/monitorPath');},
                child: Text('Monitor Path', style: textStyle,),
                shape: shape,
              ),
              FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/locate');},
                child: Text('Locate Address', style: textStyle,),
                shape: shape,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

