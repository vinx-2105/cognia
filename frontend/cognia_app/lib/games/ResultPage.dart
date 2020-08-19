import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'game_score.dart';
import '../CREDS.dart';

class ResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultPageState();
  }
}

class _ResultPageState extends State<ResultPage> {
  final List<GameScore> items = [];

  @override
  void initState() {
    super.initState();
    getGameScores();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Scores")),
        body: ListView.builder(
            itemCount: this.items.length,
            itemBuilder: _listViewItemBuilder
        )
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index){
    var gameScore = this.items[index];

    return Card(
        elevation: 2.0,
        child: ListTile(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(gameScore.timestamp),
                Icon(Icons.access_alarms),
                Text(gameScore.duration.toString()),
                Icon(Icons.apps),
                Text(gameScore.moves.toString()),
                Text("Res: " , style: TextStyle(fontWeight: FontWeight.bold)),
                Text((gameScore.duration / gameScore.moves).toStringAsFixed(2) + "s")
              ]
          ),
        ),
    );
  }

  void getGameScores() async{
    final http.Response response = await http.post(
      IP+'/api/games/get_user_scores/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token  ' +AUTH_TOKEN,
      },
    );

    if(response.statusCode==200){
      print("Success");
      print(response.body);
      final List<dynamic> responseData = json.decode(response.body);
      print(responseData);
      responseData.forEach((gameScore) {
        final GameScore score = GameScore(
            moves: gameScore['moves'],
            duration: gameScore['duration'],
            timestamp: gameScore['timestamp']
        );
        setState(() {
          items.add(score);
        });
      });
    }
    else{
      throw Exception('Failed to Load Scores');
    }
  }
}