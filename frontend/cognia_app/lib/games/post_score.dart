import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../CREDS.dart';


Future<String> postScore(int moves, int time, String timestamp) async {
  final http.Response response = await http.post(
    IP+'/api/games/register_game_score/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token  ' +AUTH_TOKEN,
    },
    body: jsonEncode(<String, dynamic>{
      'moves': moves,
      'duration': time,
      'timestamp' : timestamp,
    }),
  );

  if(response.statusCode==200){
    return 'Score Registered';
  }
  else{
    throw('NOT REGISTERED');
  }
}
