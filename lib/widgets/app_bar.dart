import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:dev_quiz/widgets/score_card.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
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
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ])),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(user.photoUrl),
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
