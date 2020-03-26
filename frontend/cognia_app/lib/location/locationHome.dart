import 'package:flutter/material.dart';

class LocationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/userLocation');},
              child: Text('Current Location'),
              color: Colors.grey[200],
            ),
            FlatButton(
              onPressed: () {Navigator.pushNamed(context, '/locate');},
              child: Text('Locate Address'),
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}

