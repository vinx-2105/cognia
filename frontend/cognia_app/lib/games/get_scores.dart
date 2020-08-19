import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../CREDS.dart';


Future<String> getScores() async {
  final http.Response response = await http.post(
    IP+'/api/games/get_user_scores/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token  ' +AUTH_TOKEN,
    },
  );

  if(response.statusCode==200){
    print(json.decode(response.body));
    return 'Success';
  }
  else{
    throw Exception('Failed to Load Scores');
  }
}