import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/images/Ecommerce campaign-amico (1).png'),
              height: 600,
            ),
            Text(
              'welcome to our application ',
              style: TextStyle(
                fontFamily: 'Popins',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Text(
              ' Control your own retail',
              style: TextStyle(
                  fontFamily: 'Popins',
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Login');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 246, 148, 62),
                ),
              ),
              child: Text(
                'Begin the jurney',
                style: TextStyle(
                    fontFamily: 'Popins',
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
