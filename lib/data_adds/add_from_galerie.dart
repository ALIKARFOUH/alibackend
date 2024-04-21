// Importations
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as image_lib;

// Classe AddFromGallery
class AddFromGallery extends StatefulWidget {
  @override
  _AddFromGalleryState createState() => _AddFromGalleryState();
}

// État de AddFromGallery
class _AddFromGalleryState extends State<AddFromGallery> {
  // Propriétés
  File? _imageFile;
  String? _imageUrl;
  final _imageUrlController = TextEditingController();
  final picker = ImagePicker();

  // Méthode pour obtenir une image depuis la galerie
  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imageUrl =
            null; // Réinitialiser l'URL de l'image lorsque qu'une nouvelle image est sélectionnée
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Aucune image sélectionnée')));
      }
    });
  }

  // Méthode pour transformer l'image en .png ou .jpg
  Future<File?> _convertImage(File imageFile) async {
    image_lib.Image image = image_lib.decodeImage(imageFile.readAsBytesSync())!;
    image_lib.Image convertedImage = image_lib.copyResize(image,
        width: 500); // Redimensionner l'image si nécessaire
    File? newImageFile;
    if (imageFile.path.toLowerCase().endsWith('.png')) {
      newImageFile = File('${imageFile.path}.png');
      await newImageFile.writeAsBytes(image_lib.encodePng(convertedImage));
    } else if (imageFile.path.toLowerCase().endsWith('.jpg') ||
        imageFile.path.toLowerCase().endsWith('.jpeg')) {
      newImageFile = File('${imageFile.path}.jpg');
      await newImageFile.writeAsBytes(image_lib.encodeJpg(convertedImage,
          quality: 85)); // Définir la qualité de compression pour JPEG
    }
    return newImageFile;
  }

  // Méthode pour télécharger et uploader une image
  Future<void> _uploadImage() async {
    if (_imageFile != null) {
      try {
        print('Début du téléchargement de l\'image');
        File? convertedImage = await _convertImage(_imageFile!);
        if (convertedImage != null) {
          FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(
              bucket: 'alinourhen-a890e.appspot.com');
          Reference storageReference = firebaseStorage.ref().child(
              'Enfant/${DateTime.now().millisecondsSinceEpoch}.${convertedImage.path.split('.').last}');
          UploadTask uploadTask = storageReference.putFile(convertedImage);
          TaskSnapshot snapshot = await uploadTask;
          String downloadUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            _imageUrl = downloadUrl;
            print(downloadUrl);

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Image téléchargée avec succès')));
          });
          Navigator.pushReplacementNamed(context, '/config');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Erreur lors de la conversion de l\'image')));
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Erreur lors du téléchargement de l\'image')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Aucune image sélectionnée')));
    }
  }

  // Méthode pour supprimer l'image sélectionnée
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
        title: Text('Ajouter une média'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null
                ? Text('Aucune image sélectionnée.')
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
              child: Text('Sélectionner une image'),
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
                      decoration: InputDecoration(
                          labelText: 'Entrez l\'URL de l\'image'),
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
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: _uploadImage,
            ),
          ],
        ),
      ),
    );
  }
}
