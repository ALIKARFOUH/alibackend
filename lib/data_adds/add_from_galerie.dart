import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class AddFromGalleryim extends StatefulWidget {
  @override
  _AddFromGalleryState createState() => _AddFromGalleryState();
}

class _AddFromGalleryState extends State<AddFromGalleryim> {
  File? _imageFile;
  String? _imageUrl;
  final _imageUrlController = TextEditingController();
  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imageUrl = null; // Reset imageUrl when new image is picked
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      await uploadTask.whenComplete(() => setState(() {}));
    } else if (_imageUrl != null && _imageUrl!.isNotEmpty) {
      http.Response response = await http.get(Uri.parse(_imageUrl!));
      if (response.statusCode == 200) {
        _imageFile = File('${_imageUrl.hashCode}.jpg');
        await _imageFile!.writeAsBytes(response.bodyBytes);
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('images/${DateTime.now().millisecondsSinceEpoch}');
        UploadTask uploadTask = storageReference.putFile(_imageFile!);
        await uploadTask.whenComplete(() => setState(() {}));
      }
    }
  }

  Future<void> _deleteImage() async {
    if (_imageFile == null) return;
    setState(() {
      _imageFile = null;
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
            _imageFile == null
                ? Text('No image selected.')
                : Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.file(_imageFile!),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: _deleteImage,
                        ),
                      ),
                    ],
                  ),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
            Container(
  decoration: BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.transparent)),
  ),
  child: Row(
    children: [
      Expanded(
        child: TextField(
          controller: _imageUrlController,
          decoration: InputDecoration(labelText: 'Enter Image URL'),
          onChanged: (value) {
            setState(() {
              _imageUrl = value;
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
              top:700,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed:(){_uploadImage();
                 print('Image uploaded'); 
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFromGalleryim()),
              );
                 },),              
  ),
    ],
  ),
),
      );
          
  }
}
