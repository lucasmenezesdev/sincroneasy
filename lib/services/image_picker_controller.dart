import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:sincroneasy/services/firebase_storage.dart';
import 'package:sincroneasy/services/firestore_db.dart';
import 'package:path/path.dart' as p;

class ImagePickerController {
  late FirebaseFirestore _db;
  late FirebaseStorage _storageRef;
  late String _userUID;

  ImagePickerController({required String userUID}) {
    _db = FirestoreDB.get();
    _storageRef = FirebaseStg.get();
    _userUID = userUID;
  }

  Future pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      final tempImage = File(pickedImage.path);
      try {
        await _storageRef
            .ref('users/consumers/$_userUID/profile/profile_image')
            .putFile(tempImage);
        final imageURL = await _storageRef
            .ref('users/consumers/$_userUID/profile/profile_image')
            .getDownloadURL();
        postProfileImage(imageURL);
      } on FirebaseException catch (e) {
        print(e.message);
      }
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  postProfileImage(String url) async {
    if (_userUID != null) {
      try {
        await _db
            .collection('consumers')
            .doc(_userUID)
            .update({'profile_image': url});
      } on FirebaseException catch (e) {
        print(e.message);
      }
    }
  }
}
