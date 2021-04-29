import 'package:dev_quiz/core/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: SvgPicture.asset('assets/svg/logo.svg'),
        ),
      ),
    );
  }
}
