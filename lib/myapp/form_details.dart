import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime_type/mime_type.dart'; //
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/models/form_model.dart';

class FormDetails extends StatefulWidget {
  final File file;

  const FormDetails({super.key, required this.file});
  @override
  _FormDetailsState createState() => _FormDetailsState();
}

class _FormDetailsState extends State<FormDetails> {
  String _description = '';
  final _duration = TextEditingController(text: '30');
  String _selectedGender = 'Both';
  String _selectedAgeRange = '18-25';

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
                'Configuration form',
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
              child: Image.file(
                widget.file,
                height: 300,
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
            SizedBox(height: 10),
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
            SizedBox(height: 10),
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
            SizedBox(height: 30),
            Text('Add duration in seconds'),
            TextFormField(
              controller: _duration,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              maxLines: 1,
              keyboardType: TextInputType.number,
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
                        SettableMetadata(contentType: 'image/jpeg'));
                    final downloadUrl = await storageRef.getDownloadURL();
                    final form = FormModel(
                      description: _description,
                      age: _selectedAgeRange,
                      duration: int.parse(_duration.text),
                      gender: _selectedGender,
                      isImage: true,
                      url: downloadUrl,
                    );
                    await firestore.doc(id).set(form.toJson());
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Image uploaded successfully')));
                    Navigator.of(context).pop();
                    print('generated id $id');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error uploading image')));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 246, 148, 62),
                  ),
                ), // inserer buttom de login
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
