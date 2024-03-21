import 'package:flutter/material.dart';
import 'package:namer_app/component/gridwiew.dart';
import 'package:namer_app/component/menubar.dart';

class Addadds extends StatelessWidget {
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
        body: Center(
          child: Container(
            padding: EdgeInsets.all(8.0),
            constraints: BoxConstraints(
                maxWidth: 600), // Limit the width of the gridview
            child: GridViewExample(),
          ),
        ),
        bottomNavigationBar: Menubar(
          currentIndex: 1,
          selectedIconColor: Color.fromARGB(255, 246, 148, 62),
        ));
  }
}
