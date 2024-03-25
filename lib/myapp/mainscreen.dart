import 'package:flutter/material.dart';
import 'package:namer_app/myapp/addadds.dart'; // this page conatins head and footer of elements after login process

class Mainscreen extends StatelessWidget {
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
      ), // add logodatadoit
      body: SafeArea(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[400],
        selectedIconTheme: IconThemeData(
            color: Color.fromARGB(
                255, 246, 148, 62)), //when you select the icon color
        unselectedIconTheme: IconThemeData(
            color: Colors.white), //when you unselect the icon color

        selectedItemColor: Color.fromARGB(
            255, 246, 148, 62), //when you select the icon  text color
        unselectedItemColor:
            Colors.white, //when you unselect the icon  text color
        onTap: (int index) {
          if (index == 1) {
            // Check if the tapped item is the "Add" icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addadds()),
            );
          }
        }, // Navigate to AddAddsPage
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // home icon call
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('lib/images/addddsicon.png')), // add logo plus
            label: 'Add', // plus icon call
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'menu', // plus  icon call
          ),
        ],
      ),
    );
  }
}
