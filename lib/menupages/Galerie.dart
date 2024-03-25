import 'package:flutter/material.dart';
import 'package:namer_app/data_adds/add_from_galerie.dart';

class Galerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galerie'), // Titre de l'appBar
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward), // Icône du bouton Suivant
            onPressed: () {
              // Appelez la fonction _getImage() à partir de AddFromGallery.dart
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFromGallery()),
              );
            },
          ),
        ],
      ),
      body: Center(child: Text('grap from galerie')),
    );
  }
}
