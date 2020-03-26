import 'package:flutter/material.dart';
import 'home/home.dart';
import 'about/about.dart';
import 'home/login_page.dart';
import 'memos/MemoMainPage.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=>LoginPage(),
    '/about': (context)=>About(),
    '/home':(context)=>Home(),
    '/memos' : (context) => Memos(),
  },
));

