import 'package:flutter/material.dart';

class Memos extends StatelessWidget {

  final double menuFontSize = 26.0;
  final double menuTextPadding = 30.0;
  final double raisedButtonMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY MEMOS', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple[500],
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: (){},
            child: Padding(
              child:Text('My People', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
              padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.deepPurple[500]),
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Padding(
              child:Text('My Places', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
              padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.deepPurple[500]),
            ),
          ),
        ],
      ),
    );
  }
}