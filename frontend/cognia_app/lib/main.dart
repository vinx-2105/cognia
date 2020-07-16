import 'package:cognia_app/home/FirstPage.dart';
import 'package:flutter/material.dart';

import 'home/PatientHome.dart';
import 'home/CaretakerHome.dart';

import 'about/about.dart';

//login and signup
import 'home/SignUpForm.dart';
import 'home/SignInForm.dart';

//profile
import 'profile/UpdateProfileForm.dart';
import 'profile/ProfilePage.dart';
import 'profile/AddCaretakerForm.dart';
import 'profile/RemoveCaretakerForm.dart';

import 'home/FirstPage.dart';

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

//Games
import 'games/GamesMainPage.dart';
import 'games/TileGame.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/patientHome', // Remove this to make login Page home
      routes: {
        '/': (context)=>FirstPage(),
        '/about': (context)=>About(),
        '/caretakerHome':(context)=>CaretakerHome(),
        '/patientHome':(context)=>PatientHome(),


        '/profile':(context)=>ProfilePage(),
        '/updateProfile':(context)=>UpdateProfileForm(),
        '/addCaretaker':(context)=>AddCaretakerForm(),
        '/removeCaretaker':(context)=>RemoveCaretakerForm(),


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

        //Games
        '/games' : (context) => Games(),
        '/tileGame' : (context) => TileGame(),
      },
    );
  }
}