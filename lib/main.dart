import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/acceuil.dart';
import 'package:namer_app/myapp/addadds.dart';
import 'package:namer_app/myapp/auth/createacc.dart';
import 'package:namer_app/myapp/auth/forgotpassword.dart';
import 'package:namer_app/myapp/homepage.dart';
import 'package:namer_app/myapp/auth/login.dart';
import 'package:namer_app/myapp/pagemenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDlAtpbMgs5FI97Vq7ZyFHw8vIC8EKHGOg",
        appId: "1:1023368834165:android:5274e5647824296ca75c3c",
        messagingSenderId: "1023368834165",
        projectId: "alinourhen-a890e",
        storageBucket: "alinourhen-a890e.appspot.com"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      title: 'My App',
      initialRoute: '/Acceuil',
      routes: {
        '/Login': (context) => Login(),
        '/home': (context) => Homepage(),
        '/menu': (context) => Pagemenu(),
        '/addads': (context) => Addadds(),
        '/forget': (context) => ForgotPassword(),
        '/create': (context) => Createacc(),
        '/Acceuil': (context) => Acceuil(),
      },
    );
  }
}
