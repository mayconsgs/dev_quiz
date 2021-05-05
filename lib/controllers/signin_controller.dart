import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class SignInController extends GetxController {
  final _isLoading = false.obs;

  final loginController = TextEditingController();
  final passController = TextEditingController();

  bool get isLoading => _isLoading.value;

  String get login => loginController.text;
  String get pass => passController.text;

  final _loginError = false.obs;

  bool get hasLoginError => _loginError.value;

  Future<void> signIn() async {
    _isLoading.value = true;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: login,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _loginError.value = true;
      } else if (e.code == 'wrong-password') {
        _loginError.value = true;
      }
    }

    _isLoading.value = false;
  }
}
