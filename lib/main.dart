
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/addadds.dart';
import 'package:namer_app/myapp/homepage.dart';
import 'package:namer_app/myapp/login.dart';
import 'package:namer_app/myapp/pagemenu.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/Login': (context) => Login(),
        '/homepage':(context) => Homepage(),
        '/menu': (context) =>Pagemenu(),
        '/addads':(context) => Addadds(),
      },
    );
  }
}