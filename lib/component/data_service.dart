import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/models/form_model.dart';

class DataService {
  static Future<List<FormModel>> getData() async {
    List<FormModel> data = [];

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("ads").get();

      data = querySnapshot.docs.map((documentSnapshot) {
        return FormModel.fromJson(documentSnapshot.data());
      }).toList();
    } catch (e) {
      print(e);
    }

    return data;
  }

  static Future<List<FormModel>> getImages() async {
    List<FormModel> data = [];
    List<FormModel> images = [];
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("ads").get();

      data = querySnapshot.docs.map((documentSnapshot) {
        return FormModel.fromJson(documentSnapshot.data());
      }).toList();
      for (int i = 0; i < data.length; i++) {
        if (data[i].isImage) {
          images.add(data[i]);
        }
      }
      print("images: ${images.length}");
    } catch (e) {
      print(e);
    }

    return images;
  }
}
