import 'package:flutter/material.dart';

class Games extends StatelessWidget {

  final double menuFontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GAMES', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightGreen[500],
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        children: <Widget>[
          Padding(
              child: FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/tileGame');
                },
                padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.account_circle, size: 120.0, color: Colors.blueAccent,),
                    Text(
                      'Tile Game',
                      style: TextStyle(fontSize: menuFontSize),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              padding: EdgeInsets.all(10.0)
          ),
          Padding(
            child: FlatButton(
              onPressed: (){
                //Navigator.pushNamed(context, '/memoimagegridplaces');
              },
              padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.explore, size: 120.0, color: Colors.blueAccent,),
                  Text('game 2'
                      '',
                    style: TextStyle(fontSize: menuFontSize),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0),
                side: BorderSide(
                  color: Colors.black,

                  width: 2.0,
                ),
              ),
            ),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}