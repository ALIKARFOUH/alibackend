import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class AddVideoGallery extends StatefulWidget {
  @override
  _AddVideoGalleryState createState() => _AddVideoGalleryState();
}

class _AddVideoGalleryState extends State<AddVideoGallery> {
  late File _videoFile;
  String? _videoUrl;
  final _videoUrlController = TextEditingController();
  final picker = ImagePicker();
  late VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _getVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _videoFile = File(pickedFile.path);
        _videoUrl = null;
        _controller = VideoPlayerController.file(_videoFile)
          ..initialize().then((_) {
            setState(() {});
          });
      } else {
        print('No video selected.');
      }
    });
  }

  Future<void> _uploadVideo() async {
    if (_videoFile != null) {
      try {
        print('Début du téléchargement de video');
        FirebaseStorage firebaseStorage =
            FirebaseStorage.instanceFor(bucket: 'alinourhen-a890e.appspot.com');
        Reference storageReference = firebaseStorage
            .ref()
            .child('file/${DateTime.now().millisecondsSinceEpoch}');
        TaskSnapshot snapshot = await storageReference.putFile(_videoFile);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          _videoUrl = downloadUrl;
          print(downloadUrl);

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('video téléchargée avec succès')));
        });
        Navigator.pushReplacementNamed(context, 'form_details2');
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Erreur lors du téléchargement de video')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Aucune video sélectionnée')));
    }
  }

  Future<void> _deleteVideo() async {
    if (_videoFile == null) return;
    setState(() {
      _videoFile = File('');
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
