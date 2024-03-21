import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/login.dart';

class Resetpassword extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String email = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 0, top: 20, bottom: 20),
            child: Text(
              'Reset password',
              style: TextStyle(
                  color: Color.fromARGB(255, 245, 173, 110), fontSize: 40),
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                email = value
                    .trim(); // Update the email variable when the user enters text
              },
              decoration: InputDecoration(
                hintText: 'Please enter the mail here',
                labelText: 'mail field',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Please confirm the mail here',
                labelText: 'mail field',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
                    if (email.isNotEmpty) {
                      // Check if the email is not empty
                      await _auth.sendPasswordResetEmail(email: email);
                      // Send password reset email
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Password reset email sent to $email'),
                        ),
                      );
                      // Show a message confirming that the password reset email has been sent
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                      // Navigate back to the login page after sending the email
                    } else {
                      // Show an error message if the email is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter your email'),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                    // Show an error message if there's an error during the password reset process
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('An error occurred. Please try again later.'),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 246, 148, 62)),
                ),
                child: Text('Send', style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
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
