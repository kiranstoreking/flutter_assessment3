import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class WelcomeScreen extends StatelessWidget {
  final String userName;
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  WelcomeScreen({
    required this.userName,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: IntroAppBar(
        title: "You're all set!",
        subtitle: "We're already searching for jobs that match your profile.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Celebration GIF
                Image.asset(
                  'assets/gifs/celebrate.gif',
                  width: 180,
                  height: 180,
                ),
                SizedBox(height: 24),

                // Greeting Text
                Text(
                  "Glad to have you,",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                ),
                SizedBox(height: 8),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
