import 'package:flutter/material.dart';

class Menubar extends StatelessWidget {
  final int currentIndex;
  final Color selectedIconColor;

  const Menubar({
    Key? key,
    required this.currentIndex,
    required this.selectedIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple[400],
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedIconTheme: IconThemeData(color: selectedIconColor),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.orange, // Set the selected item color to orange
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      currentIndex:
          currentIndex, // Use the currentIndex passed in the constructor
      onTap: (index) {
        if (index == currentIndex) {
          return;
        }

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/addads');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/menu');
            break;
          default:
            break;
        }
      },
    );
  }
}
