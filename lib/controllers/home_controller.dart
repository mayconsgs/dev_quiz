import 'dart:convert';

import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum HomeState { success, loading, error, empty }

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  _getUser() async {
    final response = await rootBundle.loadString('database/user.json');

    user = UserModel.fromJson(response);
  }

  _getQuizzes() async {
    final response = await rootBundle.loadString('database/quizzes.json');
    final list = jsonDecode(response) as List;

    quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
  }

  Future<void> getInitialData() async {
    state = HomeState.loading;

    await _getUser();
    await _getQuizzes();

    state = HomeState.success;
  }
}
