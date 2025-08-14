// import 'package:flutter/material.dart';
// import 'package:flutter_assignment3/core/constants/app_assets.dart';
// import 'package:flutter_assignment3/core/theme/app_colors.dart';
// import 'package:flutter_assignment3/core/widgets/custom_button.dart';
// import 'package:flutter_assignment3/core/widgets/educational_option.dart';
// import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

// class EducationalBackgroundScreen extends StatefulWidget {
//   final VoidCallback? onBack;
//   final int currentPage;
//   final int totalPages;

//   const EducationalBackgroundScreen({
//     super.key,
//     this.onBack,
//     required this.currentPage,
//     required this.totalPages,
//   });

//   @override
//   _EducationalBackgroundScreenState createState() =>
//       _EducationalBackgroundScreenState();
// }

// class _EducationalBackgroundScreenState
//     extends State<EducationalBackgroundScreen> {
//   String selectedOption = "Graduate"; // Default selected option

//   void selectOption(String option) {
//     setState(() {
//       selectedOption = option;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: IntroAppBar(
//         title: "What's your educational background?",
//         subtitle: "This helps companies get a better sense of your background.",
//         currentPage: widget.currentPage,
//         totalPages: widget.totalPages,
//         onBack: widget.onBack,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Text(
//                       "This helps companies get a better sense of your background.",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 20),
//                     EducationalOption(
//                       title: "10th/12th Pass",
//                       subtitle: "Secondary Education",
//                       imagePaths: AppAssets.school,
//                       isSelected: selectedOption == "10th/12th Pass",
//                       onChanged: (_) => selectOption("10th/12th Pass"),
//                     ),
//                     EducationalOption(
//                       title: "ITI/Diploma",
//                       subtitle: "Technical Education",
//                       imagePaths: AppAssets.diploma,
//                       isSelected: selectedOption == "ITI/Diploma",
//                       onChanged: (_) => selectOption("ITI/Diploma"),
//                     ),
//                     EducationalOption(
//                       title: "Graduate",
//                       subtitle: "Bachelor's Degree",
//                       imagePaths: AppAssets.graduate,
//                       isSelected: selectedOption == "Graduate",
//                       onChanged: (_) => selectOption("Graduate"),
//                     ),
//                     EducationalOption(
//                       title: "Post Graduate",
//                       subtitle: "Master's Degree",
//                       imagePaths: AppAssets.postGraduate,
//                       isSelected: selectedOption == "Post Graduate",
//                       onChanged: (_) => selectOption("Post Graduate"),
//                     ),
//                     EducationalOption(
//                       title: "Professional Course",
//                       subtitle: "Specialized Training",
//                       imagePaths: AppAssets.professionalCourse,
//                       isSelected: selectedOption == "Professional Course",
//                       onChanged: (_) => selectOption("Professional Course"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             CustomButton(
//               text: "Next : Your Skills",
//               onPressed: () {
//                 // Action for next button
//               },
//             ),
//             SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
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
  State<EducationalBackgroundScreen> createState() =>
      _EducationalBackgroundScreenState();
}

class _EducationalBackgroundScreenState
    extends State<EducationalBackgroundScreen> {
  String selectedOption = "Graduate";

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildOption(
                    title: "10th/12th Pass",
                    subtitle: "Secondary Education",
                    imagePath: AppAssets.school,
                  ),
                  _buildOption(
                    title: "ITI/Diploma",
                    subtitle: "Technical Education",
                    imagePath: AppAssets.diploma,
                  ),
                  _buildOption(
                    title: "Graduate",
                    subtitle: "Bachelor's Degree",
                    imagePath: AppAssets.graduate,
                  ),
                  _buildOption(
                    title: "Post Graduate",
                    subtitle: "Master's Degree",
                    imagePath: AppAssets.postGraduate,
                  ),
                  _buildOption(
                    title: "Professional Course",
                    subtitle: "Specialized Training",
                    imagePath: AppAssets.professionalCourse,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Next : Your Skills",
              onPressed: () {
                // Navigate to next screen
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required String subtitle,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EducationalOption(
        title: title,
        subtitle: subtitle,
        imagePaths: imagePath,
        isSelected: selectedOption == title,
        onChanged: (_) => selectOption(title),
      ),
    );
  }
}
