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

      //when you select the icon color
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedIconTheme: IconThemeData(
          color: Color.fromARGB(
              255, 246, 148, 62)), //when you unselect the icon color
      //when you select the icon text color
      unselectedItemColor: Colors.white, //when you unselect the icon text color
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home', // home icon call
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add), // add logo plus
          label: 'Add', // plus icon call
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu', // plus icon call
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        // Check if the clicked index is the same as the current index
        if (index == currentIndex) {
          return; // Do nothing if the indexes are the same
        }

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(
                context, '/home'); // Navigate to HomePage
            break;
          case 1:
            Navigator.pushReplacementNamed(
                context, '/addads'); // Navigate to AddAdsPage
            break;
          case 2:
            Navigator.pushReplacementNamed(
                context, '/menu'); // Navigate to MenuPage
            break;
          default:
            break;
        }
      },
    );
  }
}
//'/Login': (context) => Login(),
   //     '/homepage':(context) => Homepage(),
    //    '/menu': (context) =>Menupage()
    //  },