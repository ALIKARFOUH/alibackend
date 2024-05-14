import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/myapp/homepage.dart';
import 'package:namer_app/myapp/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Createacc extends StatefulWidget {
  @override
  _CreateaccState createState() => _CreateaccState();
}

class _CreateaccState extends State<Createacc> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _passwordVisible = false;

  Future<void> showSnackbar(BuildContext context, String message) async {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool> checkEmail(
      String email, String name, String password, BuildContext context) async {
    if (email.isEmpty) {
      await showSnackbar(context, 'Please enter your email');
      return true;
    } else if (!EmailValidator.validate(email)) {
      await showSnackbar(context, 'Please enter a valid email');
      return true;
    } else {
      if (await isEmailRegistered(email)) {
        await showSnackbar(context, 'That email already exists');
        return true;
      } else if (name.isEmpty) {
        await showSnackbar(context, 'Please enter your name');
        return true;
      } else if (password.isEmpty) {
        await showSnackbar(context, 'Please enter your password');
        return true;
      }
      return false;
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      // Check if the email address already exists in Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user information')
          .where('email', isEqualTo: email)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking if email is registered: $e');
      return false; // Return false to indicate email is not registered
    }
  }

  Future<void> saveUserData(String email, String name) async {
    try {
      await FirebaseFirestore.instance
          .collection('user information')
          .doc(email)
          .set({
        'name': name,
        'email': email,
      });
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print("Error signing up: $e");
      return false;
    }
  }

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
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            children: [
              SizedBox(height: 80),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 110, right: 0, top: 20, bottom: 20),
                  child: Text(
                    'Create new account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 245, 173, 110),
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    name = value.trim();
                  },
                  decoration: InputDecoration(
                    hintText: ' name field  ',
                    labelText: 'Please enter your name ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'email field',
                    labelText: 'Please enter your email here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'password field',
                    labelText: 'Please enter the password here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        if (!(await checkEmail(
                            email, name, password, context))) {
                          if (await signUpWithEmailAndPassword(
                              email, password)) {
                            await saveUserData(email, name);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()),
                            );
                            showSnackbar(
                              context,
                              'Welcome, your account was created successfully',
                            );
                          }
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 246, 148, 62),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10), // Adjust padding here
                      ),
                    ),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 64,
                color: Colors.deepPurple[400],
              ),
            ],
          );
        },
      ),
    );
  }
}
