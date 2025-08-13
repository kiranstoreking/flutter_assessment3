import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class EducationalBackgroundScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const EducationalBackgroundScreen({super.key, this.onBack, required this.currentPage, required this.totalPages});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  IntroAppBar(
        title: "What's your educational background?",
        subtitle: "This helps companies get a better sense of your background.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            ),
            EducationalOption(
              title: "ITI/Diploma",
              subtitle: "Technical Education",
            ),
            EducationalOption(
              title: "Graduate",
              subtitle: "Bachelor's Degree",
              isSelected: true, // Highlight this option
            ),
            EducationalOption(
              title: "Post Graduate",
              subtitle: "Master's Degree",
            ),
            EducationalOption(
              title: "Professional Course",
              subtitle: "Specialized Training",
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Action for the next button
              },
              child: Text("Next : Your Skills"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationalOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;

  const EducationalOption({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade400,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}