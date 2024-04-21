import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/homepage.dart';

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
      ),
      body: Column(
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
          SizedBox(
            width: 250,
            height: 55,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  BuildContext currentContext = context;
                  if (userCredential.user != null) {
                   
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      currentContext,
                      MaterialPageRoute(builder: (context) => Homepage()),
                      
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Account is created successfulyy ')));
                    // Navigation après la création de compte réussie
                  }
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Email invalid ')));
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
          Expanded(
            // purple box down
            child: Container(),
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
