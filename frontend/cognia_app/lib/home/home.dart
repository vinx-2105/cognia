import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  final double menuFontSize =40.0;
  final double menuTextPadding = 40.0;
  final double raisedButtonMargin=10.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COGNIA', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              child:RaisedButton(
                onPressed: (){},
                child: Padding(
                  child:Text('NAT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                color: Colors.deepPurple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:RaisedButton(
                onPressed: (){},
                child: Padding(
                  child:Text('Games', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                color: Colors.deepPurple[700],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:RaisedButton(
                onPressed: (){Navigator.pushNamed(context, '/locationHome');},
                child: Padding(
                  child:Text('Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                color: Colors.deepPurple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/memos');
                },
                child: Padding(
                  child:Text('My Memos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                color: Colors.deepPurple[700],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:RaisedButton(
                onPressed: (){},
                child: Padding(
                  child:Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                color: Colors.deepPurple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/about');
                },
                child: Padding(
                  child:Text('About', style: TextStyle(fontWeight: FontWeight.bold, fontSize: menuFontSize),),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                color: Colors.deepPurple[700],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),

          ],
        )
      ),

    );
  }
}
