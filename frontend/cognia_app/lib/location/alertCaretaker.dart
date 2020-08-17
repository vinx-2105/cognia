import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AlertCaretaker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALERT CARETAKER'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SpinKitPouringHourglass(
              color: Colors.blue,
              size: 120.0,
            ),
            SizedBox(height: 30,),
            Text("Alerting Caretaker", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: Colors.black,
                ),
              ),
          ],
        )
      ),
    );
  }
}

