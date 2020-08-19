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
  

  String getRoleReversal(_role){
    if (_role=='Patient'){
      return 'Caretakers';
    }
    else if(_role=='Caretaker'){
      return 'Patients';
    }
    throw ('Invalid role');
  }

  @override
  void initState(){
    super.initState();
    futureProfile = fetchUserProfile();
  }

  void handleClick(String value) {
    switch (value) {
      case 'Edit Profile':
        Navigator.popAndPushNamed(context, '/updateProfile');
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY PROFILE'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Edit Profile'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],

      ),
      body: FutureBuilder<Profile>(
        future: futureProfile,
        builder:(context, snapshot) {
          if (snapshot.hasData){
            return Container(
              color: Colors.lightGreen[500],
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.start,
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
                    "   Phone",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    "   "+snapshot.data.phone,
                    style: TextStyle(fontSize: 20.0, ),

                  ),

                  SizedBox(height: 40.0),
                  Text(
                    "   Home Address",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    "   "+snapshot.data.home_address,
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
                  Row(
                    children: <Widget>[
                      Text(
                        "   "+this.getRoleReversal(snapshot.data.role),
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {Navigator.pushNamed(context, '/addCaretaker');},),
                      IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: () {Navigator.pushNamed(context, '/removeCaretaker');},),

                    ],
                  ),
                ] 
                + 
                this.getCaretakers(snapshot) 
                + <Widget>[SizedBox(height: 40.0)]
                
              )
            );
          }
          else if(snapshot.hasError){
            Fluttertoast.showToast(msg: '${snapshot.error}');
            print('${snapshot.error}');
          }
          return Container(alignment:Alignment.center, child: CircularProgressIndicator());
        }
      ),
    );
  }
}
