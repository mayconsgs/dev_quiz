import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:dev_quiz/widgets/score_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final BuildContext context;

  AppBarWidget({required this.user, required this.context})
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
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        'Alterar foto',
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: AppColors.darkRed,
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        'SignOut',
                                        style:
                                            TextStyle(color: AppColors.darkRed),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(user.photoUrl),
                            ),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xFF7149CD), width: 2),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: ScoreCardWidget(
                    score: user.score,
                  ),
                )
              ],
            ),
          ),
        );
}
