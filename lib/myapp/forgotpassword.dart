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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image(
              image: AssetImage('lib/images/Forgot password-amico.png'),
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Forgot password',
              style: TextStyle(
                  color: Color.fromARGB(255, 245, 173, 110), fontSize: 40),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  email = value.trim();
                },
                decoration: InputDecoration(
                  hintText: 'Please enter the email here',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _auth.sendPasswordResetEmail(email: email);
                      Navigator.pushReplacementNamed(context, '/Login');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Please check your email to reset the password')));
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
            SizedBox(height: 20), // Add space here
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 64,
        color: Colors.deepPurple[400],
      ),
    );
  }
}
