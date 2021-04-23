import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/widgets/score_card.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 162,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: 'Maycon Santos',
                              style: AppTextStyles.titleBold,
                            ),
                          ])),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://github.com/mayconsgs.png'),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    ],
                  ),
                ),
                Align(alignment: Alignment(0, 1.2), child: ScoreCardWidget())
              ],
            ),
          ),
        );
}
