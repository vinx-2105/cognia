import 'package:cognia_app/Profile/Profile.dart';
import 'package:cognia_app/Profile/fetch_profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future<Profile> futureProfile;

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
                  Text(
                    "   "+snapshot.data.caretakers[0],
                    style: TextStyle(fontSize: 20.0, ),

                  ),

                ],
              ),
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
