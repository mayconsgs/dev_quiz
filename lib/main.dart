import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/screens/home_screen.dart';
import 'package:dev_quiz/screens/login_screen.dart';
import 'package:dev_quiz/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(AndroidApp());
}

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DevQuiz",
      theme: ThemeData(
        primaryColor: AppColors.purple,
        accentColor: AppColors.purple,
        cardTheme: CardTheme(
          color: AppColors.white,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.border),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(16),
          fillColor: AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.border),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 16),
            ),
            elevation: MaterialStateProperty.all(0),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppColors.purple),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 16),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            foregroundColor: MaterialStateProperty.all(AppColors.lightGrey),
            backgroundColor: MaterialStateProperty.all(AppColors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: AppColors.border,
                ),
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColors.purple),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 16),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        scaffoldBackgroundColor: Color(0xFFF5F5FA),
      ),
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
            FirebaseAuth.instance.authStateChanges().listen((user) {
              if (user == null) {
                Get.offAll(() => LoginScreen());
              } else {
                Get.offAll(() => HomeScreen());
              }
            });
          }

          return SplashScreen();
        },
      ),
    );
  }
}
