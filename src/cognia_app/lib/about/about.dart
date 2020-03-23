import 'package:flutter/material.dart';

class About extends StatelessWidget {

  final String aboutText = 'Developed By\n\nHarshit Malik\nHersh Dhillon\n Nilansh Rajput\n Vineet Madan\n\n Under the Guidance of \nDr. T.V Kalyan \nat \nIIT Ropar';
  final double textMargin = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COGNIA', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(textMargin),
            child: Text(
              aboutText,
              style: TextStyle(fontSize: 25.0, height: 2.0),
              textAlign: TextAlign.center,

            ),
          )
      ),

    );
  }
}
