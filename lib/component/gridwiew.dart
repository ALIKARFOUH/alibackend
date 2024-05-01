import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:namer_app/component/Grid_Item.dart';
import 'package:namer_app/myapp/Form-details2.dart';
import 'package:namer_app/myapp/Add_Sound.dart';
import 'package:namer_app/myapp/form_details.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Add section',
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding here
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          children: [
            // Use the custom GridItem widget for each item

            GridItem(
              text: 'add video',
              icon: Icons.play_circle_fill,
              function: () async {
                final selectedVideo = await _getVideo();
                if (selectedVideo != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => FormDetails2(
                            file: selectedVideo,
                          ))));
                }
              },
            ),
            GridItem(
              text: 'add image',
              icon: Icons.image,
              function: () async {
                final selectedImage = await _getImage();
                if (selectedImage != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => FormDetails(
                            file: selectedImage,
                          ))));
                }
              },
            ),

            GridItem(
                text: 'add sound',
                icon: Icons.volume_up,
                function: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => AddSound())));
                }),

            GridItem(
              text: 'add display ',
              icon: Icons.tv,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> _getImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

Future<File?> _getVideo() async {
  final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}
