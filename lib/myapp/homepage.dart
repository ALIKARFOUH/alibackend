import 'package:flutter/material.dart';
import 'package:namer_app/component/menubar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'),
                radius: 20,
              ),
              SizedBox(width: 8),
              // Add your title text here
            ],
          ),
          backgroundColor: Colors.deepPurple[400],
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              SizedBox(height: 8), // Add some spacing
              Image.asset(
                'lib/images/image1.jpg',
                width: screenWidth,
                height: screenWidth / 3, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4), // Add some spacing
              Image.asset(
                'lib/images/image2.jpg',
                width: screenWidth,
                height: screenWidth / 2, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4), // Add some spacing
              Image.asset(
                'lib/images/image3.jpg',
                width: screenWidth,
                height: screenWidth / 2, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4), // Add some spacing
              Image.asset(
                'lib/images/image4.jpg',
                width: screenWidth,
                height: screenWidth / 2, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Image.asset(
                'lib/images/image1.jpg',
                width: screenWidth,
                height: screenWidth / 3, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
              Image.asset(
                'lib/images/image2.jpg',
                width: screenWidth,
                height: screenWidth / 2, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4), // Add some spacing
              Image.asset(
                'lib/images/image3.jpg',
                width: screenWidth,
                height: screenWidth / 2, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4), // Add some spacing
              Image.asset(
                'lib/images/image4.jpg',
                width: screenWidth,
                height: screenWidth / 2, // Set the height based on aspect ratio
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Menubar(
          currentIndex: 0,
          selectedIconColor: Color.fromARGB(255, 246, 148, 62),
        ));
  }
}
