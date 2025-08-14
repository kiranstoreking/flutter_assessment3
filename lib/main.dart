import 'package:flutter/material.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/edit_profile_screen.dart';
import 'package:flutter_assignment3/core/theme/app_theme.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/profile_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/onboard_screens.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Search App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: IntroScreen(),
    );
  }
}
