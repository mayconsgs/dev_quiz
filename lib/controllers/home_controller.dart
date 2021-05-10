import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

enum HomeState { success, loading, error, empty }

class HomeController extends GetxController {
  final _state = HomeState.empty.obs;

  HomeState get state => _state.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  _getUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final userDocument =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    user = UserModel.fromMap(userDocument.data()!);
  }

  _getQuizzes() async {
    final quizzesDocuments =
        await FirebaseFirestore.instance.collection('quizzes').get();

    quizzes = quizzesDocuments.docs
        .map((e) => QuizModel.fromMap(e.reference, e.data()))
        .toList();
  }

  Future<void> getInitialData() async {
    _state.value = HomeState.loading;

    await _getUser();
    await _getQuizzes();

    _state.value = HomeState.success;
  }
}
