import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'UpdateProfileData.dart';
import '../CREDS.dart';


Future<String> updateProfile(UpdateProfileData _updateProfileData) async {
  final http.Response response = await http.post(
    IP+'/api/accounts/update_profile/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token  ' +AUTH_TOKEN,
    },
    body: jsonEncode(<String, String>{
      'gender': _updateProfileData.getGender(),
      'role': _updateProfileData.getRole(),
    }),
  );

  if(response.statusCode==200){
    return 'Profile Updated';
  }
  else{
    throw('Error: Profile Not Updated');
  }
}
