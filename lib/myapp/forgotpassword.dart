import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/login.dart';

class ForgotPassword extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String email = '';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(
                  left: 110, right: 0, top: 20, bottom: 20),
              child: Text(
                'Forgot password',
                style: TextStyle(
                    color: Color.fromARGB(255, 245, 173, 110), fontSize: 40),
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  email = value.trim();
                },
                decoration: InputDecoration(
                  hintText: 'Please enter the mail here',
                  labelText: 'mail field',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: SizedBox(
                width: 200, // Set the desired width
                height: 50, // Set the desired height
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _auth.sendPasswordResetEmail(email: email);
                      Navigator.pushNamed(context, '/Login');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'please check your email to reset the password ')));
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 246, 148, 62)),
                  ),
                  child: Text('Reset', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
