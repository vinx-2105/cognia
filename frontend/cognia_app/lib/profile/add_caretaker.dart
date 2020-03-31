import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../CREDS.dart';


Future<String> addCaretaker(String _username) async {
  final http.Response response = await http.post(
    IP+'/api/accounts/add_caretaker/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token  ' +AUTH_TOKEN,
    },
    body: jsonEncode(<String, String>{
      'caretaker': _username,
    }),
  );

  if(response.statusCode==200){
    return 'Caretaker Added';
  }
  else{
    throw('Error: Caretaker Not Added');
  }
}
