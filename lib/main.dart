import 'package:dev_quiz/screens/home_screen.dart';
import 'package:dev_quiz/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DevQuiz",
      home: FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          }

          return SplashScreen();
        },
      ),
    );
  }
}
