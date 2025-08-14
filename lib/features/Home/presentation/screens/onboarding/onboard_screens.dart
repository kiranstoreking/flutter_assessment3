import 'package:flutter/material.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/job_hunting_location_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/personal_info_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/qualification_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/ready_to_go_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/onboarding/role_preference_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  late List<Widget> slides;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Build pages dynamically
    slides = [
      UserInfoScreen(
        currentPage: 0,
        totalPages: 5,
        onBack: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),

      EducationalBackgroundScreen(
        currentPage: 1,
        totalPages: 5,
        onBack: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
      JobHuntingScreen(
        currentPage: 2,
        totalPages: 5,
        onBack: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
      SkillsScreen(
        currentPage: 3,
        totalPages: 5,
        onBack: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
      WelcomeScreen(
        userName: "LLdsld",
        currentPage: 4,
        totalPages: 5,
        onBack: () {
          if (_currentPage > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: slides.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return slides[index];
        },
      ),
    );
  }
}
