import 'package:dev_quiz/widgets/question_indicator_widget.dart';
import 'package:dev_quiz/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuestionIndicatorWidget(),
      body: QuizWidget(
        title: 'O que o Flutter faz em sua totalidade?',
      ),
    );
  }
}
