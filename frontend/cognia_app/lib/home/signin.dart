import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'SignInData.dart';


String IP = 'http://192.168.1.3:8000';

Future<String> logIn(SignInData _signInData) async {
  final http.Response response = await http.post(
    IP+'/api/accounts/signin/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': _signInData.username,
      'password':_signInData.password,
    }),
  );

  if(response.statusCode==200){
    return json.decode(response.body)['token'];
  }
  else{
    throw('Invalid Credentials');
  }
}