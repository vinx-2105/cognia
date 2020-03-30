import 'package:cognia_app/profile/Profile.dart';
import 'package:cognia_app/profile/fetch_profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future<Profile> futureProfile;


  //returns the list of caretakers in text widgets
  List<Widget> getCaretakers(snapshot){
    List<Widget> res=[];

    for(var i=0; i<snapshot.data.caretakers.length; i++){
      res.add(
        Text(
          "   "+snapshot.data.caretakers[i],
          style: TextStyle(fontSize: 20.0, ),

        )
      );
    }
    if (res.length==0)
      res.add(Text("   None",style: TextStyle(fontSize: 20.0, )));
    return res;
  }

  @override
  void initState(){
    super.initState();
    futureProfile = fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY PROFILE'),
        centerTitle: true,

      ),
      body: FutureBuilder<Profile>(
        future: futureProfile,
        builder:(context, snapshot) {
          if (snapshot.hasData){
            return Container(
              color: Colors.lightGreen[500],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  CircleAvatar(
                    backgroundColor: Colors.grey[500],
                    child: Text(snapshot.data.first_name[0]+snapshot.data.last_name[0], style: TextStyle(fontSize: 30.0, color: Colors.black)),
                    radius: 60.0,
                  ),

                  Divider(thickness: 0.5, height: 30.0,),
                  Text(
                    snapshot.data.first_name + " "+ snapshot.data.last_name,
                    style: TextStyle(fontSize: 40.0, ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    "   Username",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    "   "+snapshot.data.username,
                    style: TextStyle(fontSize: 20.0, ),

                  ),

                  SizedBox(height: 40.0),
                  Text(
                    "   Gender",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    "   "+snapshot.data.gender,
                    style: TextStyle(fontSize: 20.0, ),

                  ),

                  SizedBox(height: 40.0),
                  Text(
                    "   Role",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    "   "+snapshot.data.role,
                    style: TextStyle(fontSize: 20.0, ),

                  ),
                  SizedBox(height: 40.0),
                  Text(
                    "   Caretakers",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                ] 
                + 
                this.getCaretakers(snapshot) 
                + 
                <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: (){

                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.white, width: 2.0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('EDIT PROFILE', style: TextStyle(color: Colors.white, fontSize: 18.0),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ]
              )
            );
          }
          else if(snapshot.hasError){
            Fluttertoast.showToast(msg: '${snapshot.error}');
            print('${snapshot.error}');
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}
