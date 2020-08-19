import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'post_score.dart';

int level = 16;

class TileGame extends StatefulWidget {
  final int size;

  const TileGame({Key key, this.size = 16}) : super(key: key);
  @override
  _TileGameState createState() => _TileGameState();
}

class _TileGameState extends State<TileGame> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];
  int previousIndex = -1;
  bool flip = false;

  int time = 0;
  Timer timer;

  int moves = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(i.toString());
    }
    startTimer();
    data.shuffle();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if(!mounted) return;
      setState(() {
        time = time + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Time $time Moves $moves",
                  style: Theme.of(context).textTheme.display2,
                ),
              ),
              Theme(
                data: ThemeData.dark(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) => FlipCard(
                      key: cardStateKeys[index],
                      onFlip: () {
                        if (!flip) {
                          flip = true;
                          previousIndex = index;
                        } else {
                          flip = false;
                          if (previousIndex != index) {
                            if (data[previousIndex] != data[index]) {
                              cardStateKeys[previousIndex]
                                  .currentState
                                  .toggleCard();
                              previousIndex = index;
                            } else {
                              cardFlips[previousIndex] = false;
                              cardFlips[index] = false;
                              print(cardFlips);

                              if (cardFlips.every((t) => t == false)) {
                                print("Won");
                                showResult();
                              }
                            }
                          }
                        }
                        moves += 1;
                      },
                      direction: FlipDirection.HORIZONTAL,
                      flipOnTouch: cardFlips[index],
                      front: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.deepOrange.withOpacity(0.3),
                      ),
                      back: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.deepOrange,
                        child: Center(
                          child: Text(
                            "${data[index]}",
                            style: Theme.of(context).textTheme.display2,
                          ),
                        ),
                      ),
                    ),
                    itemCount: data.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Won!!!"),
        content: Text(
          "Time $time Moves $moves",
          style: Theme.of(context).textTheme.display2,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {

              // Get Time Stamp
              DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
              String str = dateFormat.format(DateTime.now());

              // Make the API call, (int moves, int duration, string timestamp)
              postScore(moves, time, str).then((value)  {
                Fluttertoast.showToast(msg: '$value');
                print("Success");
                Navigator.popUntil(context, ModalRoute.withName('/games'));
              }).catchError((err){
                Fluttertoast.showToast(msg: '$err');
                print(err);
                Navigator.popUntil(context, ModalRoute.withName('/games'));
              });
              // Exit to home

            },
            child: Text("BACK"),
          ),
        ],
      ),
    );
  }
}
