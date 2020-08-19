import 'dart:convert';

class GameScore {

  final int moves;
  final int duration;
  final String timestamp;

  GameScore({this.moves, this.duration, this.timestamp});

  factory GameScore.fromJson(Map<String,dynamic> json) {
    return GameScore(
        moves: json['moves'],
        duration: json['duration'],
        timestamp: json['timestamp']
    );
  }
}