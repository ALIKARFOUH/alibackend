import 'package:flutter/material.dart';
import 'package:namer_app/component/spacedItemsList.dart';
import 'package:namer_app/component/menubar.dart';
import 'package:namer_app/menupages/Editprofile.dart';

class Pagemenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[400],
          // add logodatadoit
        ),
        backgroundColor: Color(0xFFE8DCCE),
        body: Container(
          width: double.infinity,
          height: screenHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.deepPurple[400],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple[400]!,
                Color(0xFFE8DCCE),
              ],
              stops: [0.5, 0.5],
            ),
          ), // Equal stops to divide the colors evenly
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'),
                    radius:
                        90, // Increase the radius to make the CircleAvatar bigger
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editprofile()),
                        );
                      },
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Container(
                width: 400,
                height: 450,
                margin: EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Set the border radius here
                  child: Container(
                    color: Colors.white.withOpacity(0.8),
                    child: Center(
                      child: SpacedItemsList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Menubar(
          currentIndex: 2,
          selectedIconColor: Color.fromARGB(255, 246, 148, 62),
        ));
  }
}
