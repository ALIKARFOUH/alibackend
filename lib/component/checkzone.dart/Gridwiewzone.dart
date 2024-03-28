import 'package:flutter/material.dart';

import 'package:namer_app/component/checkzone.dart/grid_itemzone.dart';
import 'package:namer_app/data_adds/add_from_galerie.dart';
import 'package:namer_app/menupages/Galerie.dart';

class GridViewzone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Active zones ',
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding here
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          children: [
       GridItemzone(image:Image.asset('lib/images/image1.jpg'), video:null , destination:Galerie()), 
       GridItemzone(image:Image.asset('lib/images/image1.jpg'), video:null , destination:Galerie()), 
       GridItemzone(image:Image.asset('lib/images/image1.jpg'), video:null , destination:Galerie()),
       GridItemzone(image:Image.asset('lib/images/image1.jpg'), video:null , destination:Galerie()), 
       GridItemzone(image:Image.asset('lib/images/image1.jpg'), video:null , destination:Galerie()), 
       GridItemzone(image:Image.asset('lib/images/image1.jpg'), video:null , destination:Galerie())     // Use the custom GridItem widget for each item     // Use the custom GridItem widget for each item
    ],
        ),
      ),
    );
  }
}

