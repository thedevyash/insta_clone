import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/resources/storage_methods.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
      String description, Uint8List file, String uid) async {
    String res = "some error ocurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
    } catch (e) {}
  }
}
