import 'package:flutter/material.dart';
import 'package:namer_app/component/checkzone.dart/Gridwiewzone.dart';

class Checkconnectedevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'),
              radius: 20,
            ),
            SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: GridViewzone(),
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
