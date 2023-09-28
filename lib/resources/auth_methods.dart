import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/resources/storage_methods.dart';
import 'package:insta_clone/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser(
      {required String email,
      required String username,
      required String password,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error ocurred";

    try {
      if (email.isNotEmpty &&
          username.isNotEmpty &&
          password.isNotEmpty &&
          bio.isNotEmpty &&
          file != null) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user = model.User(
            username: username,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            email: email,
            bio: bio,
            followers: [],
            following: []);

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        print(cred.user!.uid);
      }

      res = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "The email address is badly formatted.";
      } else if (err.code == 'weak-password') {
        res = "Password should be at least 6 characters";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = "Some error ocurred";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Enter all details";
      }
    } on FirebaseAuthException catch (err) {
      res = err.toString();
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
