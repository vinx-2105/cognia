import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'signup.dart';
import 'SignUpData.dart';


// Define a custom Form widget.
class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}


// Define a corresponding State class.
// This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  SignUpData _signUpData = new SignUpData();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightGreen[500],
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: ListView(
                children: <Widget>[
                  SizedBox(height: 40.0),
                  Container(
                    child: Text('COGNIA', style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 40.0),
                  // Add TextFormFields and RaisedButton here.
                  TextFormField(
                    style: TextStyle(
                      fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "first name",
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
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a first name';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      this._signUpData.first_name = value;
                    },
                  ),
                  SizedBox(height: 40.0),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "last name",
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
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      this._signUpData.last_name = value;
                    },
                  ),
                  SizedBox(height: 40.0),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "email",
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                          return 'username cannot be empty';
                        }
                        else if(EmailValidator.validate(value)==false){
                          return 'not a valid email';
                        }
                        return null;
                    },
                    onSaved: (String value){
                      this._signUpData.email = value;
                      this._signUpData.username = value;
                    },
                  ),
                  SizedBox(height: 40.0),
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
                      if (value.isEmpty) {
                        return 'Enter a password';
                      }
                      else if(value.length<8){
                        return 'Enter 8 chars minimum';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      this._signUpData.password = value;
                    },
                  ),
                  SizedBox(height: 40.0),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 40.0,color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "confirm password",
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
                        return 'Enter a password';
                      }
                      else if(value.length<8){
                        return 'Enter 8 chars minimum';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      this._signUpData.password2 = value;
                    },
                  ),

                  SizedBox(height: 40.0),
                  FlatButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                        //do the signup
                        _formKey.currentState.save();
                        registerUser(_signUpData).then((value){
                          Navigator.popAndPushNamed(context, '/');
                        }).catchError((err){
                          Fluttertoast.showToast(msg: 'Error');
                        });
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white, width: 2.0),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 30.0),textAlign: TextAlign.center,),
                      ),
                  )

                ]
            )
        ),
      )
    );

  }
}
