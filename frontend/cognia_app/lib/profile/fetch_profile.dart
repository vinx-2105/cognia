import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Profile.dart';
import '../home/AUTH_TOKEN.dart';

String IP = 'http://192.168.1.3:8000';

Future<Profile> fetchUserProfile() async {
  final http.Response response = await http.post(
    IP+'/api/accounts/get_profile/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token  ' +AUTH_TOKEN,
    },
  );

  if(response.statusCode==200){
    return Profile.fromJSON(json.decode(response.body));
  }
  else{
    throw Exception('Failed to Load Profile');
  }
}