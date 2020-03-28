import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  final double menuFontSize =26.0;
  final double menuTextPadding = 15.0;
  final double menuTopMargin = 20.0;
  final double raisedButtonMargin=10.0;
  
  @override
  Widget build(BuildContext context) {

    RoundedRectangleBorder btnShape =  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide(
          color: Colors.white,
          width: 3.0,
        )
    );

    TextStyle menuTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: menuFontSize,
        color: Colors.white,
        letterSpacing: 4.0,
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('COGNIA', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/appBg1.jpg'), fit: BoxFit.cover)
        ),
        padding: EdgeInsets.fromLTRB(0, menuTopMargin, 0, 0),
        child: ListView(
          children: <Widget>[
            Padding(
              child:FlatButton(
                onPressed: (){},
                child: Padding(
                  child:Text('NAT', style: menuTextStyle,),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                shape: btnShape,
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:FlatButton(
                onPressed: (){},
                child: Padding(
                  child:Text('GAMES', style: menuTextStyle,),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                shape: btnShape,
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:FlatButton(
                onPressed: (){Navigator.pushNamed(context, '/locationHome');},
                child: Padding(
                  child:Text('LOCATION', style: menuTextStyle,),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                shape: btnShape,
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/memos');
                },
                child: Padding(
                  child:Text('MEMOS', style: menuTextStyle,),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                shape: btnShape,
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:FlatButton(
                onPressed: (){},
                child: Padding(
                  child:Text('PROFILE', style: menuTextStyle,),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                shape: btnShape,
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),
            Padding(
              child:FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/about');
                },
                child: Padding(
                  child:Text('ABOUT', style: menuTextStyle,),
                  padding: EdgeInsets.fromLTRB(0.0, menuTextPadding, 0.0, menuTextPadding),
                ),
                shape: btnShape,
              ),
              padding: EdgeInsets.all(raisedButtonMargin),
            ),

          ],
        )
      ),

    );
  }
}
