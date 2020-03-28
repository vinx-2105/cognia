import 'package:flutter/material.dart';

import 'home/home.dart';
import 'about/about.dart';
import 'home/login_page.dart';

//Memos
import 'memos/MemoMainPage.dart';
import 'memos/MemoImageGridPeople.dart';
import 'memos/MemoImageGridPlaces.dart';

//Location
import 'location/locationHome.dart';
import 'location/userLocation.dart';
import 'location/showLocation.dart';
import 'location/locate.dart';
import 'location/map.dart';
import 'location/monitorPath.dart';
import 'location/getRoute.dart';
import 'location/plotRoute.dart';
import 'location/setHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // Remove this to make login Page home
      routes: {
        '/': (context)=>LoginPage(),
        '/about': (context)=>About(),
        '/home':(context)=>Home(),

        //Memo pages
        '/memos' : (context) => Memos(),
        MemoImageGridPeople.routeName: (ctx) => MemoImageGridPeople(),
        MemoImageGridPlaces.routeName: (ctx) => MemoImageGridPlaces(),

        //Location pages
        '/locationHome' : (context) => LocationHome(),
        '/userLocation': (context) => CurrentLocation(),
        '/monitorPath' : (context) => MonitorPath(),
        '/locate': (context) => Locate(),
        '/showLocation': (context) => ShowLocation(),
        '/setHome': (context) => SetHome(),
        '/getRoute': (context) => GetRoute(),
        '/plotRoute': (context) => PlotRoute(),
        '/map': (context) => ShowMap(),
      },
    );
  }
}

