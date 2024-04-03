import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setBool('rememberMe', _rememberMe);
  }

  _login() async {
    try {
      if (_rememberMe) {
        _saveData();
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add a SizedBox between AppBar and Text
          Text(
            'Welcome',
            style: TextStyle(
              fontFamily: 'Popins',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Container(
            height: 300, // Adjust the height as needed
            width: 400, // Adjust the width as needed
            child: Image(
              image: AssetImage('lib/images/iconhome.png'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _emailController, // Use the controller for email
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
              controller:
                  _passwordController, // Use the controller for password
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
            onPressed: _login,
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
          SizedBox(width: 10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              ),
              Text('Remember Me'),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            height: 50,
            color: Colors.deepPurple[400],
          ),
        ],
      ),
    );
  }
}
