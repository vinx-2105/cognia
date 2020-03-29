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

  Future<String> futureSignupResult;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                // Add TextFormFields and RaisedButton here.
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "First Name",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    this._signUpData.first_name = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Last Name",
                  ),
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
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    this._signUpData.username = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    this._signUpData.email = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    this._signUpData.password = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    this._signUpData.password2 = value;
                  },
                ),


                RaisedButton(
                  onPressed: (){
                    if (_formKey.currentState.validate()) {
                      Fluttertoast.showToast(msg: "Valid data!");
                      //do the signup
                      _formKey.currentState.save();
                      futureSignupResult = registerUser(_signUpData).then(onValue);
                    }
                    else
                      Fluttertoast.showToast(msg: "Invalid data!");
                  },
                  child: Text("Sign Up"),
                )

              ]
          )
      )
    );

  }
}
