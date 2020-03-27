import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';
import 'about/about.dart';
import 'home/login_page.dart';

import './providers/pictures.dart';

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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<Pictures>(create: (_) => Pictures()),
      ],
      child: Container(
        child: MaterialApp(
          title: 'Camera & Gallery Tutorial',
          theme: ThemeData(
            primarySwatch: Theme.of(context).primaryColor,
            accentColor: Colors.teal,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
            '/locate': (context) => Locate(),
            '/showLocation': (context) => ShowLocation(),
            '/map': (context) => ShowMap(),
          },
        ),
      ),
    );
  }
}

