import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'signin.dart';
import 'SignInData.dart';
import '../CREDS.dart';
import '../profile/Profile.dart';
import '../profile/fetch_profile.dart';

import 'package:email_validator/email_validator.dart';
import '../PROFILE.dart';



// Define a custom Form widget.
class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}


// Define a corresponding State class.
// This class holds data related to the form.
class SignInFormState extends State<SignInForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  SignInData _signInData = new SignInData();

  Future<Profile> futureProfile;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text('SIGN IN'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightGreen[500],
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              Container(
                child: Text('COGNIA', style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 40.0),
              Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        // Add TextFormFields and RaisedButton here.
                        TextFormField(
                          style: TextStyle(
                            fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "username",
                            hintStyle: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white)
                            ),
                            errorStyle: TextStyle(
                              fontSize: 20.0,color: Colors.grey[50],
                            )
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'username cannot be empty';
                            }
                            else if(EmailValidator.validate(value)==false){
                              return 'not a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String value){
                            this._signInData.username = value;
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "password",
                            hintStyle: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Colors.white)
                            ),
                            errorStyle: TextStyle(
                              fontSize: 20.0,color: Colors.grey[50],
                            )
                          ),
                          validator: (value) {
                            if(value.length==0){
                              return 'password cannot be empty';
                            }
                            else if (value.length<8) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          onSaved: (String value){
                            this._signInData.password = value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        FlatButton(
                          onPressed: (){
                            if (_formKey.currentState.validate()) {

                              //do the signin
                              _formKey.currentState.save();
                              logIn(_signInData).then((value)  {
                                AUTH_TOKEN=value;
                                //fetch the profile
                                fetchUserProfile().then((value){
                                  if(value.role=='Caretaker'){
                                    //then go to home
                                    Navigator.of(context).pushNamedAndRemoveUntil('/caretakerHome', (Route<dynamic> route)=> false);
                                    // Navigator.pushReplacementNamed(context, '/home');
                                  }
                                  else if(value.role=='Patient'){
                                    Navigator.of(context).pushNamedAndRemoveUntil('/patientHome', (Route<dynamic> route)=> false);
                                  }
                                  else{
                                    //then go to profile
                                    Navigator.pushReplacementNamed(context, '/updateProfile');
                                  }
                                  //set the profile variable
                                  PROFILE =value;
                                }).catchError((err){
                                  Fluttertoast.showToast(msg: '$err');
                                });
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
                            child: Text('SIGN IN', style: TextStyle(color: Colors.white, fontSize: 30.0),textAlign: TextAlign.center,),
                          ),
                        ),


                      ]
                  )
              ),
            ],
          ),
        )
    );

  }
}