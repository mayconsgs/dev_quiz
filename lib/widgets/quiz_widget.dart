import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/widgets/awnser_widget.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          const SizedBox(height: 24),
          AwnserWidget(
            label: 'Kit de desenvolvimento de interface de usuário',
            isRight: false,
            isSelected: false,
          ),
          AwnserWidget(
            label:
                'Possibilita a criação de aplicativos compilados nativamente',
            isRight: true,
            isSelected: true,
          ),
          AwnserWidget(
            label: 'Acho que é uma marca de café do Himalaia',
            isRight: false,
            isSelected: false,
          ),
          AwnserWidget(
            label: 'Possibilita a criação de desktops que são muito incríveis',
            isRight: false,
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
