import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'SignUpData.dart';

String IP = 'http://192.168.43.106:8000';

Future<String> registerUser(SignUpData _signUpData) async {
  final http.Response response = await http.post(
    IP+'/api/accounts/signup/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': _signUpData.username,
      'email': _signUpData.email,
      'first_name':_signUpData.first_name,
      'last_name':_signUpData.last_name,
      'password':_signUpData.password,
      'password2':_signUpData.password2,
    }),
  );

  if(response.statusCode==200){
    return 'User Registered';
  }
  else{
    return response.body;
  }
}
