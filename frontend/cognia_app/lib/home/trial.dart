import 'package:flutter/material.dart';

class Trial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        color: Colors.lightGreen[500],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Text('COGNIA', style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 80)
            ),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/signup');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white, width: 2.0),

              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 20.0),textAlign: TextAlign.center,),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white,
              height: 80.0,
            ),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/signin');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white, width: 2.0),

              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('SIGN IN', style: TextStyle(color: Colors.white, fontSize: 20.0),textAlign: TextAlign.center,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
