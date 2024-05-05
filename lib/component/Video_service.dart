import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:namer_app/models/video_model.dart';

class DataService {
  static Future<List<VideoModel>> getData() async {
    List<VideoModel> data = [];

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("ads").get();

      data = querySnapshot.docs.map((documentSnapshot) {
        return VideoModel.fromJson(documentSnapshot.data());
      }).toList();
    } catch (e) {
      print(e);
    }

    return data;
  }

  static Future<List<VideoModel>> getvideos() async {
    List<VideoModel> data = [];
    List<VideoModel> videos = [];
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection("ads").get();

      data = querySnapshot.docs.map((documentSnapshot) {
        return VideoModel.fromJson(documentSnapshot.data());
      }).toList();

      for (int i = 0; i < data.length; i++) {
        data[i].setId(querySnapshot.docs[i].id);
        if (!data[i].isImage) {
          videos.add(data[i]);
        }
      }
      print("videos: ${videos.length}");
    } catch (e) {
      print(e);
    }

    return videos;
  }

  static Future<void> deleteVideo(String id) async {
    try {
      await FirebaseFirestore.instance.collection('ads').doc(id).delete();
      await FirebaseStorage.instance.ref('files').child(id).delete();
      print('$id Deleted successfully');
    } catch (e) {
      print(e.toString());
    }
  }
}
