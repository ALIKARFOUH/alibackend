import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300, // Adjust the height as needed
            width: double.infinity, // Adjust the width as needed
            child: Image(
              image: AssetImage('lib/images/iconhome.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              // Use the controller for email
              decoration: InputDecoration(
                hintText: 'Mail Field',
                labelText: 'Enter your email here ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              // Use the controller for password
              obscureText: true,
              decoration: InputDecoration(
                hintText: ('password field '),
                labelText: 'enter your password ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              try {
                UserCredential userCredential =
                    await _auth.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                if (userCredential.user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              } catch (e) {
                print(e);
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 246, 148, 62),
              ),
            ),
            child: Text(
              'login',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/forget');
                },
                child: Text(
                  'forgot password',
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 148, 62),
                  ),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/create');
                },
                child: Text(
                  'dont have an account ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 148, 62),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Spacer(),
          Container(
            height: 50,
            color: Colors.deepPurple[400],
          ),
        ],
      ),
    );
  }
}
