import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddSound extends StatefulWidget {
  final File? file;
  const AddSound({Key? key, this.file}) : super(key: key);
  @override
  _AddSoundState createState() => _AddSoundState();
}

class _AddSoundState extends State<AddSound> {
  File? _soundFile;
  String? _soundUrl;

  Future<void> _pickSound() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['mp3'],
      );
      if (result != null) {
        setState(() {
          _soundFile = File(result.files.single.path!);
        });
      } else {
        print('Sound selection cancelled or failed.');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick sound: $error')),
      );
    }
  }

  Future<void> _uploadSound() async {
    try {
      final firestore = FirebaseFirestore.instance.collection('music');
      final id = firestore.doc().id;

      final storageRef = FirebaseStorage.instance.ref().child('music/$id');
      final uploadTask = storageRef.putFile(_soundFile!);

      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      await firestore.doc(id).set({
        'soundUrl': downloadUrl,
      });
      setState(() {
        _soundUrl = downloadUrl;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sound uploaded successfully!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload sound: $error')),
      );
    }
  }

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
            SizedBox(width: 30),
            Center(
              child: Text(
                'Add music',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Center(
              child: _soundFile != null
                  ? Text('Selected sound:')
                  : Text('No sound selected yet'),
            ),
            _soundFile != null
                ? Center(
                    child: Text(
                        _soundFile!.path.split('/').last), // Display filename
                  )
                : SizedBox(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _pickSound,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 246, 148, 62),
                ),
              ),
              child: Text(
                'Choose Sound',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: _soundFile != null
                    ? _uploadSound
                    : null, // Disable if no sound selected
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    _soundFile != null
                        ? Color.fromARGB(255, 246, 148, 62)
                        : Colors.grey, // Gray out disabled button
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
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
