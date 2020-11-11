import 'package:flutter/material.dart';
import 'package:mindmum/Authentication/AuthenticationIntroScreen.dart';
import 'package:mindmum/OnboardingScreen/Onboarding.dart';
import 'package:mindmum/OnboardingScreen/OnboardingIntroScreen.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mind Mum",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingIntroScreen(),
    );
  }
}
