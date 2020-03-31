import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../PROFILE.dart';
import 'fetch_profile.dart';
import 'remove_caretaker.dart';
import '../CREDS.dart';

import 'package:email_validator/email_validator.dart';




// Define a custom Form widget.
class RemoveCaretakerForm extends StatefulWidget {
  @override
  RemoveCaretakerFormState createState() {
    return RemoveCaretakerFormState();
  }
}


// Define a corresponding State class.
// This class holds data related to the form.
class RemoveCaretakerFormState extends State<RemoveCaretakerForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String _caretaker_username = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text('REMOVE CARETAKER'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightGreen[500],
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: Column(
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
                        hintText: "caretaker username",
                        hintStyle: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold ),
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
                          return 'not a valid username';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String value){
                        this._caretaker_username = value;
                      },
                    ),
                    SizedBox(height: 40.0),
                    FlatButton(
                      onPressed: (){
                        if (_formKey.currentState.validate()) {

                          _formKey.currentState.save();
                          removeCaretaker(_caretaker_username).then((value)  {
                            fetchUserProfile().then((value){
                              PROFILE=value;
                            });
                            Navigator.pop(context);
                          }).catchError((err){
                            Fluttertoast.showToast(msg: 'Error');
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
                        child: Text('REMOVE CARETAKER', style: TextStyle(color: Colors.white, fontSize: 25.0),textAlign: TextAlign.center,),
                      ),
                    ),
                  ]
              )
          )
        )
    );

  }
}