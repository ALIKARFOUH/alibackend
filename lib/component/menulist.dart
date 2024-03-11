import 'package:flutter/material.dart';

class Menulist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
  borderRadius: BorderRadius.circular(20), child:    ColoredBox(
    color: Colors.white, 
  child: Material(
    child: ListTile(
      title: Text('Menu'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Subtitle 1'),
          Text('Subtitle 2'),
           Text('Subtitle 1'),
          Text('Subtitle 2'),
           Text('Subtitle 1'),
          Text('Subtitle 2'),
        ],
      ),),)  ),);
      
  }
}