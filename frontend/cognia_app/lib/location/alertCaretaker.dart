import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_maintained/sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'locationDefaults.dart' as defaults;

class AlertCaretaker extends StatelessWidget {

  static const platform = const MethodChannel('sendSms');

  @override
  Widget build(BuildContext context) {

    if(defaults.isSMSEnabled) {
      SmsSender sender = new SmsSender();
      sender.sendSms(
          new SmsMessage(defaults.alertNumber, defaults.alertMessage));
    }
    if(defaults.isCallEnabled) {
      launch("tel:${defaults.alertNumber}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Caretaker'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SpinKitPouringHourglass(
              color: Colors.blue,
              size: 120.0,
            ),
            SizedBox(height: 30,),
            Text("Alerting Caretaker", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: Colors.black,
                ),
              ),
          ],
        )
      ),
    );
  }
}

