import 'package:dev_quiz/models/question_model.dart';
import 'package:dev_quiz/widgets/next_button_widget.dart';
import 'package:dev_quiz/widgets/question_indicator_widget.dart';
import 'package:dev_quiz/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  final List<QuestionModel> questionsList;

  ChallengeScreen(this.questionsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuestionIndicatorWidget(),
      body: QuizWidget(
        question: questionsList[0],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: NextButtonWidget(
                  label: 'Pular',
                  ontap: () {},
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: NextButtonWidget.green(
                  label: 'Confirmar',
                  ontap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
