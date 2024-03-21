import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/addadds.dart';
import 'package:namer_app/myapp/homepage.dart';
import 'package:namer_app/myapp/login.dart';
import 'package:namer_app/myapp/pagemenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDiKKD1IpMguwhpVsRBN0LEIlZbdAZTfng",
        appId: "1:308229101178:android:23f7a1cebd42fcded18dc3",
        messagingSenderId: "308229101178",
        projectId: "appdatadoit"),
  );
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
        '/homepage': (context) => Homepage(),
        '/menu': (context) => Pagemenu(),
        '/addads': (context) => Addadds(),
      },
    );
  }
}
