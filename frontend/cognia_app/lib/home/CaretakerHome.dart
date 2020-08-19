import 'package:flutter/material.dart';
import '../CREDS.dart';


class CaretakerHome extends StatelessWidget {

  final double menuFontSize =18.0;
  final double menuTextPadding = 15.0;
  final double menuTopMargin = 20.0;
  final double raisedButtonMargin=10.0;

  @override
  Widget build(BuildContext context) {

    RoundedRectangleBorder btnShape =  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: BorderSide(
          color: Colors.black,
          width: 3.0,
        )
    );

    TextStyle menuTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: menuFontSize,
      color: Colors.black,
      letterSpacing: 2.0,
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('COGNIA: Caretaker', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightGreen[500],
        centerTitle: true,
        leading: null,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, menuTopMargin, 0, 0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            children: <Widget>[
              // Padding(
              //     child: FlatButton(
              //       onPressed: (){},
              //       padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Icon(Icons.data_usage, size: 100.0, color: Colors.blueAccent,),
              //           Text(
              //             'NAT',
              //             style: TextStyle(fontSize: menuFontSize),
              //             textAlign: TextAlign.center,
              //           )
              //         ],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(40.0),
              //         side: BorderSide(
              //             color: Colors.black,
              //             width: 2.0
              //         ),
              //       ),
              //     ),
              //     padding: EdgeInsets.all(10.0)
              // ),
              // Padding(
              //     child: FlatButton(
              //       onPressed: (){},
              //       padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Icon(Icons.directions_walk, size: 100.0, color: Colors.blueAccent,),
              //           Text(
              //             'GAMES',
              //             style: TextStyle(fontSize: menuFontSize),
              //             textAlign: TextAlign.center,
              //           )
              //         ],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(40.0),
              //         side: BorderSide(
              //             color: Colors.black,
              //             width: 2.0
              //         ),
              //       ),
              //     ),
              //     padding: EdgeInsets.all(10.0)
              // ),
               Padding(
                   child: FlatButton(
                     onPressed: (){
                       Navigator.pushNamed(context, '/locationHome');
                     },
                     padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Icon(Icons.edit_location, size: 100.0, color: Colors.blueAccent,),
                         Text(
                           'LOCATION',
                           style: TextStyle(fontSize: menuFontSize),
                           textAlign: TextAlign.center,
                         )
                       ],
                     ),
                     shape: RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(40.0),
                       side: BorderSide(
                           color: Colors.black,
                           width: 2.0
                       ),
                     ),
                   ),
                   padding: EdgeInsets.all(10.0)
              ),
              // Padding(
              //     child: FlatButton(
              //       onPressed: (){
              //         Navigator.pushNamed(context, '/memos');
              //       },
              //       padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Icon(Icons.collections, size: 100.0, color: Colors.blueAccent,),
              //           Text(
              //             'MEMOS',
              //             style: TextStyle(fontSize: menuFontSize),
              //             textAlign: TextAlign.center,
              //           )
              //         ],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(40.0),
              //         side: BorderSide(
              //             color: Colors.black,
              //             width: 2.0
              //         ),
              //       ),
              //     ),
              //     padding: EdgeInsets.all(10.0)
              // ),
              Padding(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/profile');
                    },
                    padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.face, size: 100.0, color: Colors.blueAccent,),
                        Text(
                          'PROFILE',
                          style: TextStyle(fontSize: menuFontSize),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                      side: BorderSide(
                          color: Colors.black,
                          width: 2.0
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0)
              ),
              // Padding(
              //     child: FlatButton(
              //       onPressed: (){
              //         Navigator.pushNamed(context, '/about');
              //       },
              //       padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Icon(Icons.bookmark_border, size: 100.0, color: Colors.blueAccent,),
              //           Text(
              //             'ABOUT',
              //             style: TextStyle(fontSize: menuFontSize),
              //             textAlign: TextAlign.center,
              //           )
              //         ],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(40.0),
              //         side: BorderSide(
              //             color: Colors.black,
              //             width: 2.0
              //         ),
              //       ),
              //     ),
              //     padding: EdgeInsets.all(10.0)
              // ),
              Padding(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route)=> false);
                    },
                    padding: EdgeInsets.symmetric(horizontal : 20.0, vertical: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.lock, size: 100.0, color: Colors.blueAccent,),
                        Text(
                          'LOGOUT',
                          style: TextStyle(fontSize: menuFontSize),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                      side: BorderSide(
                          color: Colors.black,
                          width: 2.0
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(10.0)
              ),
            ],
          )
      ),
    );
  }
}