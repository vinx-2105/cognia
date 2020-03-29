import 'package:cognia_app/profile/ProfilePage.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'about/about.dart';

//login and signup
import 'home/SignUpForm.dart';
import 'home/SignInForm.dart';

import 'home/trial.dart';

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
      initialRoute: '/', // Remove this to make login Page home
      routes: {
        '/': (context)=>Trial(),
        '/about': (context)=>About(),
        '/home':(context)=>Home(),

        '/profile':(context)=>ProfilePage(),

        '/signup': (context)=>SignUpForm(),
        '/signin': (context)=>SignInForm(),

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