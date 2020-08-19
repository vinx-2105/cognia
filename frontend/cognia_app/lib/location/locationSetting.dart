import 'package:flutter/material.dart';
import 'locationDefaults.dart' as defaults;

class LocationSetting extends StatelessWidget {

  final minDistanceField = TextEditingController();
  final minIntervalField = TextEditingController();
  final maxSafeRadField = TextEditingController();

  @override
  Widget build(BuildContext context) {

    minDistanceField.text = defaults.minDistMoved.toString();
    minIntervalField.text = defaults.minTimeInterval.toString();
    maxSafeRadField.text = defaults.safeRadiusValue.toString();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Record Movement", style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold), ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Minimum distance(m)", style: TextStyle(fontSize: 20),),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: minDistanceField,
                            decoration: InputDecoration(
                                //border: InputBorder.none,
                              ),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Minimum Interval(s)",style: TextStyle(fontSize: 20,), ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: minIntervalField,
                            decoration: InputDecoration(
                              //border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.black54, thickness: 3, height: 25, indent: 20, endIndent: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Safe Zone", style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold), ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Safe Zone",style: TextStyle(fontSize: 20),),
                        Switch(
                          value: defaults.isSafeRadiusEnabled,
                          activeColor: Colors.blueAccent[200],
                          activeTrackColor: Colors.blueAccent[300],
                          onChanged: (value) {
                            defaults.isSafeRadiusEnabled = value;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Radius(m)",style: TextStyle(fontSize: 20,), ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: maxSafeRadField,
                            decoration: InputDecoration(
                              //border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.black54, thickness: 3, height: 25, indent: 20, endIndent: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Alert Caretaker", style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold), ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("SMS",style: TextStyle(fontSize: 20),),
                        Switch(
                          value: defaults.isSMSEnabled,
                          activeColor: Colors.blueAccent[200],
                          activeTrackColor: Colors.blueAccent[300],
                          onChanged: (value) {
                            defaults.isSMSEnabled = value;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Call",style: TextStyle(fontSize: 20),),
                        Switch(
                          value: defaults.isCallEnabled,
                          activeColor: Colors.blueAccent[200],
                          activeTrackColor: Colors.blueAccent[300],
                          onChanged: (value) {
                            defaults.isCallEnabled = value;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Notification",style: TextStyle(fontSize: 20),),
                        Switch(
                          value: defaults.isNotifEnabled,
                          activeColor: Colors.blueAccent[200],
                          activeTrackColor: Colors.blueAccent[300],
                          onChanged: (value) {
                            defaults.isNotifEnabled= value;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.black54, thickness: 3, height: 25, indent: 20, endIndent: 20,),
              ],
            ),
            FlatButton.icon(
              onPressed: () {
                defaults.minDistMoved = int.parse(minDistanceField.text);
                defaults.minTimeInterval = int.parse(minIntervalField.text);
                defaults.safeRadiusValue = int.parse(maxSafeRadField.text);
                Navigator.pushNamed(context, '/locationHome');
              },
              icon: Icon(Icons.save_alt, color: Colors.blueAccent,),
              label: Text('Save', style: TextStyle(fontSize: 25, color: Colors.blueAccent,),),
            ),
          ],
        ),
      ),
    );
  }
}

