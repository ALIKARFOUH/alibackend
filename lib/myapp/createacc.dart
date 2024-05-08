import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/homepage.dart';
import 'package:namer_app/myapp/login.dart';

class Createacc extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String password = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 80),
          Center(
              child: Padding(
            padding:
                const EdgeInsets.only(left: 110, right: 0, top: 20, bottom: 20),
            child: Text(
              'Create new account',
              style: TextStyle(
                  color: Color.fromARGB(255, 245, 173, 110), fontSize: 40),
            ),
          )),
          SizedBox(height: 50),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  name = value.trim();
                },
                decoration: InputDecoration(
                  hintText: ' Please enter your name   ',
                  labelText: 'name field',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              )),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Please enter your email here  ',
                  labelText: 'emailfield',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              )),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Please enter the pasword here  ',
                labelText: 'password field',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 50,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  BuildContext currentContext = context;
                  if (userCredential.user != null &&
                      userCredential.user!.emailVerified) {
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      currentContext,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Account is created successfully '),
                      ),
                    );
                    // Navigation après la création de compte réussie
                  }
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'An error is detected :Mail or Passwor  is invalid '),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 246, 148, 62),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
              child: Text(
                'SIGN UP',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 50, //
            color: Colors.deepPurple[400],
          ),
        ],
      ),
    );
  }
}
