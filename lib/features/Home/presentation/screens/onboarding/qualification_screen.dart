import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/educational_option.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class EducationalBackgroundScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const EducationalBackgroundScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  _EducationalBackgroundScreenState createState() =>
      _EducationalBackgroundScreenState();
}

class _EducationalBackgroundScreenState
    extends State<EducationalBackgroundScreen> {
  String selectedOption = "Graduate"; // Default selected option

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "What's your educational background?",
        subtitle: "This helps companies get a better sense of your background.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "This helps companies get a better sense of your background.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    EducationalOption(
                      title: "10th/12th Pass",
                      subtitle: "Secondary Education",
                      icon: Icons.school,
                      isSelected: selectedOption == "10th/12th Pass",
                      onChanged: (_) => selectOption("10th/12th Pass"),
                    ),
                    EducationalOption(
                      title: "ITI/Diploma",
                      subtitle: "Technical Education",
                      icon: Icons.build,
                      isSelected: selectedOption == "ITI/Diploma",
                      onChanged: (_) => selectOption("ITI/Diploma"),
                    ),
                    EducationalOption(
                      title: "Graduate",
                      subtitle: "Bachelor's Degree",
                      icon: Icons.school,
                      isSelected: selectedOption == "Graduate",
                      onChanged: (_) => selectOption("Graduate"),
                    ),
                    EducationalOption(
                      title: "Post Graduate",
                      subtitle: "Master's Degree",
                      icon: Icons.military_tech,
                      isSelected: selectedOption == "Post Graduate",
                      onChanged: (_) => selectOption("Post Graduate"),
                    ),
                    EducationalOption(
                      title: "Professional Course",
                      subtitle: "Specialized Training",
                      icon: Icons.work,
                      isSelected: selectedOption == "Professional Course",
                      onChanged: (_) => selectOption("Professional Course"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "Next",
              onPressed: () {
                // Action for next button
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
