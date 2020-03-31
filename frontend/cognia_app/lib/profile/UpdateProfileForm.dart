import 'package:cognia_app/PROFILE.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'fetch_profile.dart';
import 'update_profile.dart';
import 'UpdateProfileData.dart';
import '../CREDS.dart';

import 'package:email_validator/email_validator.dart';




// Define a custom Form widget.
class UpdateProfileForm extends StatefulWidget {
  @override
  UpdateProfileFormState createState() {
    return UpdateProfileFormState();
  }
}


// Define a corresponding State class.
// This class holds data related to the form.
class UpdateProfileFormState extends State<UpdateProfileForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  UpdateProfileData _updateProfileData = new UpdateProfileData();


  String _gender = "Male";
  String _role ="Patient";


  // @override
  // void initState(){
  //   super.initState();
  //   _gender='Male';
  //   _role ='Patient';
  // }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text('UPDATE PROFILE'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightGreen[500],
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Add TextFormFields and RaisedButton here.
                    SizedBox(height: 40.0),
                    Container(
                      child: Text('COGNIA', style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 40.0),
                    DropdownButton<String>(
                      focusColor: Colors.black,
                      value: _gender,
                      style: TextStyle(
                        fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          _gender = newValue;
                        });
                      },
                      items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style:TextStyle(backgroundColor:Colors.grey)),
                          );
                        })
                        .toList(),
                    ),
                    SizedBox(height: 40.0),
                    DropdownButton<String>(
                      value: _role,
                      style: TextStyle(
                        fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          _role = newValue;
                        });
                      },
                      items: <String>['Patient', 'Caretaker']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style:TextStyle(backgroundColor:Colors.grey)),

                          );
                        })
                        .toList(),
                    ),
                    SizedBox(height: 40.0),
                    FlatButton(
                      onPressed: (){
                        if (_formKey.currentState.validate()) {

                          //update the profile using the API
                          _updateProfileData.setRole(_role);
                          _updateProfileData.setGender(_gender);

                          _formKey.currentState.save();
                          updateProfile(_updateProfileData).then((value)  {
                            //update the PROFILE object
                            fetchUserProfile().then((value){
                              PROFILE=value;
                            });
                            Navigator.pushReplacementNamed(context, '/profile');
                          }).catchError((err){
                            Fluttertoast.showToast(msg: '$err');
                          });
                          return Container(alignment:Alignment.center, child: CircularProgressIndicator());
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white, width: 2.0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('UPDATE PROFILE', style: TextStyle(color: Colors.white, fontSize: 30.0),textAlign: TextAlign.center,),
                      ),
                    ),


                  ]
              )
          ),
        )
    );

  }
}