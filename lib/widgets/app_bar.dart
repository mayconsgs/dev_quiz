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
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/59394133?v=4'),
                            ),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFF7149CD), width: 2),
                            )),
                      )
                    ],
                  ),
                ),
                Align(alignment: Alignment(0, 1), child: ScoreCardWidget())
              ],
            ),
          ),
        );
}
