import 'package:flutter/material.dart';
import 'package:namer_app/component/Grid_Item.dart';
import 'package:namer_app/data_adds/add_from_galerie.dart';
import 'package:namer_app/menupages/Galerie.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Add section',
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding here
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          children: [
            // Use the custom GridItem widget for each item

            GridItem(
                text: 'add video',
                icon: Icons.play_circle_fill,
                destination: AddFromGallery()),
            GridItem(
                text: 'add image',
                icon: Icons.image,
                destination: AddFromGallery()),
            GridItem(
                text: 'add sound',
                icon: Icons.volume_up,
                destination: Galerie()),
            GridItem(
                text: 'add display ', icon: Icons.tv, destination: Galerie()),
          ],
        ),
      ),
    );
  }
}
