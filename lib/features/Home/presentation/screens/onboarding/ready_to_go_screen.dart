import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/edit_profile_screen.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/profile_screen.dart';
import 'package:flutter_assignment3/screen2.dart';

class WelcomeScreen extends StatefulWidget {
  final String userName;
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const WelcomeScreen({
    Key? key,
    required this.userName,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: IntroAppBar(
        title: "You're all set!",
        subtitle: "We're already searching for jobs that match your profile.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
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
                Image.asset(
                  'assets/gifs/celebrate.gif',
                  width: 180,
                  height: 180,
                ),
                SizedBox(height: 24),
                Text(
                  "Glad to have you,",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                ),
                SizedBox(height: 8),
                Text(
                  widget.userName,
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
