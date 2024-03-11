import 'package:flutter/material.dart';
import 'package:namer_app/component/menubar.dart';
import 'package:namer_app/component/menulist.dart';


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
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.deepPurple[400]),
       width: double.infinity,
       height: screenHeight ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/datadoit_logo.jpg'),
                  radius:90, // Increase the radius to make the CircleAvatar bigger
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.edit,size: 30,),
                    onPressed: () {
                      // Add edit functionality here
                    },
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height:50),
             Container(
             width:350,
             height: 450,
             margin: EdgeInsets.only(top: 10),
             // Add another container with a different background color
             child: Center(
                child: Menulist()
           ),
        )],
        ),
        
      ),
      bottomNavigationBar: Menubar(currentIndex: 2),
    );
  }
}