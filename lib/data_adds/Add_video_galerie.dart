import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class AddVideoGallery extends StatefulWidget {
  @override
  _AddVideoGalleryState createState() => _AddVideoGalleryState();
}

class _AddVideoGalleryState extends State<AddVideoGallery> {
  File? _videoFile;
  String? _videoUrl;
  final _videoUrlController = TextEditingController();
  final picker = ImagePicker();

  Future<void> _getVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _videoFile = File(pickedFile.path);
        _videoUrl = null; // Reset videoUrl when new video is picked
      } else {
        print('No video selected.');
      }
    });
  }

  Future<void> _uploadVideo() async {
    if (_videoFile != null) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('videos/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(_videoFile!);
      await uploadTask.whenComplete(() => setState(() {}));
    } else if (_videoUrl != null && _videoUrl!.isNotEmpty) {
      // Handle video URL upload if needed
    }
  }

  Future<void> _deleteVideo() async {
    if (_videoFile == null) return;
    setState(() {
      _videoFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Media'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _videoFile == null
                    ? Text('No video selected.')
                    : Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          // Display video player widget here if needed
                          Text('Video Placeholder'),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: _deleteVideo,
                            ),
                          ),
                        ],
                      ),
                ElevatedButton(
                  onPressed: _getVideo,
                  child: Text('Select Video'),
                ),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.transparent)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _videoUrlController,
                          decoration:
                              InputDecoration(labelText: 'Enter Video URL'),
                          onChanged: (value) {
                            setState(() {
                              _videoUrl = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 700,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _uploadVideo();
                  print('Video uploaded');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
