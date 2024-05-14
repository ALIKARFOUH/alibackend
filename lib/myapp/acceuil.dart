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
              height: 200,
            ),
            Text(
              'Bienvenue sur notre application',
              style: TextStyle(
                fontFamily: 'Popins',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Navigator.pushReplacementNamed(context, '/Login');
              },
              child: Text('Se connecter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajouter l'action à effectuer pour accéder à une autre page
              },
              child: Text('Autre action'),
            ),
          ],
        ),
      ),
    );
  }
}


