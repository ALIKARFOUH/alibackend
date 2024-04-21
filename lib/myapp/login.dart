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
      ), // purple box
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('lib/images/iconhome.png'),
            ), // import de photo de page login
            Text(
              'Bienvenu',
              style: TextStyle(
                fontFamily: 'Popins',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ), // ecrire Bienvenu
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  email = value.trim();
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name here ',
                  labelText: 'nameField',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ), // preparer le text field de nom d utilisateur
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'enter your password ',
                  labelText: 'password field ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ), // preparer le text field de nom d utilisateur
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('email or password invalid')));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 246, 148, 62),
                    ),
                  ), // inserer buttom de login
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10), // boxe d'espace
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/forget');
                  },
                  child: Text(
                    'forgot password', // preparer buttom de forget password
                    style: TextStyle(
                      color: Color.fromARGB(255, 246, 148, 62),
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/create');
              },
              child: Text(
                'dont have an account ', // preparer butttom dont have account
                style: TextStyle(
                  color: Color.fromARGB(255, 246, 148, 62),
                ),
              ),
            ),
            SizedBox(height: 200), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
