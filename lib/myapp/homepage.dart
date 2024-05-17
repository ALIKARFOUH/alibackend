import 'package:flutter/material.dart';
import 'package:namer_app/component/myvedio/listviewVideo.dart';
import 'package:namer_app/component/menubar.dart';
import 'package:namer_app/models/form_model.dart';
import 'package:namer_app/component/myimages/listviewimages.dart';
import 'package:namer_app/component/mymusic/MusicList.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int carouselIndex = 0;
  final List<FormModel> datadata = [];
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Material(
                color: Colors.deepPurple[100],
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(28)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.deepPurple[100],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageSliderPageess()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage('lib/images/imaage.png'),
                        height: 240,
                        width: 385,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Play images',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 246, 148, 62),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Material(
                color: Colors.deepPurple[100],
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(28)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.deepPurple[100],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Listviewvideo()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage('lib/images/vedeo.png'),
                        height: 240,
                        width: 385,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Play video',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 246, 148, 62),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Material(
                color: Colors.deepPurple[100],
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(28)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.deepPurple[100],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MusicWidget()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: AssetImage('lib/images/musiccc.png'),
                        height: 240,
                        width: 385,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Play music',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 246, 148, 62),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
      bottomNavigationBar: Menubar(
        currentIndex: 0,
        selectedIconColor: Color.fromARGB(255, 246, 148, 62),
      ),
    );
  }
}
