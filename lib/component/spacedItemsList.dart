import 'package:flutter/material.dart';
import 'package:namer_app/component/detailpage.dart';
import 'package:namer_app/component/custombox.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(text: items[index]['text'] as String),
                  ),
                );
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



