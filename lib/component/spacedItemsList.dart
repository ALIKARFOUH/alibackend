import 'package:flutter/material.dart';
import 'package:namer_app/component/custombox.dart';
import 'package:namer_app/menupages/Editprofile.dart';
import 'package:namer_app/menupages/activationdisplay.dart';
import 'package:namer_app/menupages/checkdevices.dart';
import 'package:namer_app/menupages/setingspage.dart';
import 'package:namer_app/menupages/uploadhistorique.dart';
import 'package:namer_app/myapp/login.dart';

class SpacedItemsList extends StatelessWidget {
  const SpacedItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const items = [
      {'text': 'Edit Profile', 'icon': Icons.edit},
      {'text': 'Activate Displays', 'icon': Icons.tv},
      {'text': 'Check connected devices', 'icon': Icons.devices},
      {'text': 'Upload historique', 'icon': Icons.upload},
      {'text': 'Settings', 'icon': Icons.settings},
      {'text': 'Log out', 'icon': Icons.logout},
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Configuration '),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                switch (items[index]['text']) {
                  case 'Edit Profile':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Editprofile()),
                    );
                    break;
                  case 'Activate Displays':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Activationdisplay(),
                      ),
                    );
                    break;
                  case 'Check connected devices':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Checkconnectedevices()),
                    );
                    break;
                  case 'Upload historique':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Uploadhistorique()),
                    );
                    break;
                  case 'Settings':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setingspage()),
                    );
                    break;
                  case 'Logout':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    break;
                  // Add cases for other items here
                  default:
                    // Do something if no matching case is found
                    break;
                }
              },
              child: CustomBox(
                text: items[index]['text'] as String,
                icon: items[index]['icon'] as IconData,
              ),
            );
          },
        ),
      ),
    );
  }
}
