import 'package:cloud_firestore/cloud_firestore.dart';

class datamusic {
  static Future<List?> getAllMusic() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot musicQuerySnapshot =
          await firestore.collection('music').get();
      List data = musicQuerySnapshot.docs.map((doc) => doc.data()).toList();

      return data;
    } catch (e) {
      print('Error getting music IDs from Firebase: $e');
      return null;
    }
  }

  Future<void> deleteMusic(String musicId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('music').doc(musicId).delete();
      print('Music with ID $musicId deleted successfully.');
    } catch (e) {
      print('Error deleting music with ID $musicId: $e');
    }
  }
}
