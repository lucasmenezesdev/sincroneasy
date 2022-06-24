import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/models/user_provider.dart';
import 'package:sincroneasy/services/firebase_storage.dart';
import 'package:sincroneasy/services/firestore_db.dart';

class ImagePickerController {
  late FirebaseFirestore _db;
  late FirebaseStorage storageRef;
  late UserClient currentUser;
  late BuildContext context;

  ImagePickerController({required BuildContext context}) {
    _db = FirestoreDB.get();
    storageRef = FirebaseStg.get();
    currentUser = Provider.of<UserClient>(context);
  }

  Future pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      final tempImage = File(pickedImage.path);
      try {
        await storageRef
            .ref(
                'users/consumers/${currentUser.getUid}/profile/${tempImage.toString()}')
            .putFile(tempImage);
        final imageURL = await storageRef
            .ref(
                'users/consumers/${currentUser.getUid}/profile/${tempImage.toString()}')
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
    if (currentUser.getUid != null) {
      try {
        await _db
            .collection('consumers')
            .doc(currentUser.getUid)
            .update({'profile_image': url});
      } on FirebaseException catch (e) {
        print(e.message);
      }
    }
  }
}
