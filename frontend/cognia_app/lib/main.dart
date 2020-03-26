import 'package:flutter/material.dart';
import 'home/home.dart';
import 'about/about.dart';
import 'home/login_page.dart';
import 'memos/MemoMainPage.dart';
import 'location/locationHome.dart';
import 'location/userLocation.dart';
import 'location/showLocation.dart';
import 'location/locate.dart';
import 'location/map.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=>LoginPage(),
    '/about': (context)=>About(),
    '/home':(context)=>Home(),
    '/memos' : (context) => Memos(),
    '/locationHome' : (context) => LocationHome(),
    '/userLocation': (context) => CurrentLocation(),
    '/locate': (context) => Locate(),
    '/showLocation': (context) => ShowLocation(),
    '/map': (context) => ShowMap(),
  },
));

