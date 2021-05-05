import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class SignUpController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  final _emailExist = false.obs;
  final _passWeak = false.obs;

  bool get emailExist => _emailExist.value;
  bool get passWeak => _passWeak.value;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool get invalidPass => passController.text != confirmPassController.text;

  Rx<File> _image = Rx<File>(File(''));

  bool get hasImage => _image.value.path.isNotEmpty;
  File get image => _image.value;

  getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
  }

  signUpUser() async {
    _isLoading.value = true;

    String photoUrl = 'https://avatars.githubusercontent.com/u/59394133?v=4';
    User? user;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _passWeak.value = true;
      } else if (e.code == 'email-already-in-use') {
        _emailExist.value = true;
      }
    } catch (e) {
      print(e);
    }

    try {
      if (hasImage && user != null) {
        final taskSnapshot = await FirebaseStorage.instance
            .ref('usersProfileImages')
            .child(path.basename(image.path).replaceAll(' ', '-').toLowerCase())
            .putFile(image);

        photoUrl = await taskSnapshot.ref.getDownloadURL();
      }
    } catch (e) {
      print(e);
    }

    try {
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
            UserModel(name: nameController.text, photoUrl: photoUrl).toMap());
      }
    } catch (e) {
      print(e);
    }

    _isLoading.value = false;
  }
}
