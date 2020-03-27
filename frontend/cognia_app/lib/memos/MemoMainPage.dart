import 'package:cognia_app/widgets/images_grid.dart';
import 'package:flutter/material.dart';
import '../widgets/images_grid.dart';

class Memos extends StatelessWidget {

  final double menuFontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY MEMOS', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple[500],
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/memoimagegridpeople');
              },
              padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.folder, size: 120.0, color: Colors.blueAccent,),
                  Text(
                    'My People',
                    style: TextStyle(fontSize: menuFontSize),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.deepPurple[500]),
              ),
            ),
            padding: EdgeInsets.all(20.0)
          ),
          SizedBox(height: 10.0),
          Padding(
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/memoimagegridplaces');
              },
              padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.folder, size: 120.0, color: Colors.blueAccent,),
                  Text('My Places',
                    style: TextStyle(fontSize: menuFontSize),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.deepPurple[500]),
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
        ],
      ),
    );
  }
}