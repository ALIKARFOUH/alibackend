import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/models/video_model.dart';
import 'package:video_player/video_player.dart';

class FormDetails2 extends StatefulWidget {
  final File file;

  const FormDetails2({Key? key, required this.file}) : super(key: key);

  @override
  _FormDetails2State createState() => _FormDetails2State();
}

class _FormDetails2State extends State<FormDetails2> {
  String _description = '';
  String _selectedGender = 'Both';
  String _selectedAgeRange = '18-25';

  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.file(widget.file);
    _initializeVideoPlayerFuture = _videoController.initialize();
    _videoController.setLooping(true);
    _videoController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Center(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(height: 30),
            Text('Add description here'),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                _description = value.trim();
              },
            ),
            SizedBox(height: 50),
            Text('Select Gender'),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              items: <String>['Man', 'Woman', 'Both']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 50),
            Text('Select Age Range'),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: _selectedAgeRange,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAgeRange = newValue!;
                });
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              items: <String>[
                '0-12',
                '12-18',
                '18-25',
                '25-35',
                '35-45',
                '45-55',
                '+55',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final firestore =
                        FirebaseFirestore.instance.collection('ads');

                    final id = firestore.doc().id;

                    final storageRef =
                        FirebaseStorage.instance.ref().child('files/$id');
                    await storageRef.putFile(widget.file,
                        SettableMetadata(contentType: 'video/mp4'));
                    final downloadUrl = await storageRef.getDownloadURL();
                    final form = VideoModel(
                      description: _description,
                      age: _selectedAgeRange,
                      gender: _selectedGender,
                      isImage: false,
                      url: downloadUrl,
                    );
                    await firestore.doc(id).set(form.toJson());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Video uploaded successfully')));
                    Navigator.of(context).pop();
                    print('generated id $id');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error uploading video')));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 246, 148, 62),
                  ),
                ), // insert login button
                child: Text(
                  'Submit ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Add some space between the button and the bottom
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.deepPurple[400],
      ),
    );
  }
}
