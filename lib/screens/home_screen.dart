import 'package:dev_quiz/controllers/home_controller.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/screens/challenge_screen.dart';
import 'package:dev_quiz/widgets/app_bar.dart';
import 'package:dev_quiz/widgets/level_button_widget.dart';
import 'package:dev_quiz/widgets/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });

    controller.getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(16),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 160 / 177,
                children: controller.quizzes!
                    .map(
                      (e) => GestureDetector(
                        child: QuizCardWidget(quiz: e),
                        onTap: () {
                          Get.to(() => ChallengeScreen(e.questions));
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.chartSecondary,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      ),
    );
  }
}
