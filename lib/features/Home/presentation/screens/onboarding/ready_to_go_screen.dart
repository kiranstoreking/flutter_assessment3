import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class WelcomeScreen extends StatelessWidget {
  final String userName;
   final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;


  WelcomeScreen({required this.userName, this.onBack, required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  IntroAppBar(
        title: "You're all set!",
        subtitle: "We're already searching for jobs that match your profile.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.blue, // Background color for header
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're all set!",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "We're already searching for jobs that match your profile.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50), // Space between header and content

          // Celebration Icon
          Icon(
            Icons.party_mode, // Replace with the appropriate icon
            size: 80,
            color: Colors.yellow,
          ),

          SizedBox(height: 20), // Space before greeting text

          // Greeting message
          Text(
            "Glad to have you,",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            userName,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}