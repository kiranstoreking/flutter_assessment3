// import 'package:flutter/material.dart';
// import 'package:flutter_assignment3/core/widgets/custom_button.dart';
// import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

// class SkillsScreen extends StatelessWidget {
//   final VoidCallback? onBack;
//   final int currentPage;
//   final int totalPages;

//   const SkillsScreen({
//     super.key,
//     this.onBack,
//     required this.currentPage,
//     required this.totalPages,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: IntroAppBar(
//         title: "What are you great at?",
//         subtitle: "Select your top skills so the right companies can find you.",
//         currentPage: currentPage,
//         totalPages: totalPages,
//         onBack: onBack,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select your top skills so the right companies can find you.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: 'Search your skills',
//                 prefixIcon: Icon(Icons.search),
//                 filled: true,
//                 fillColor: Colors.white,
//                 contentPadding: EdgeInsets.symmetric(
//                   vertical: 16.0,
//                   horizontal: 16.0,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30), // Rounded border
//                   borderSide: BorderSide(color: Colors.grey.shade400),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide(color: Colors.grey.shade400),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text('Select at least 3', style: TextStyle(fontSize: 14)),
//             SizedBox(height: 16),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 SkillChip(label: 'UI/UX Design'),
//                 SkillChip(label: 'Full stack Developer', isSelected: true),
//                 SkillChip(label: 'Product Design', isSelected: true),
//                 SkillChip(label: 'Marketing'),
//                 SkillChip(label: 'Animation'),
//                 SkillChip(label: 'Data Analytics'),
//                 SkillChip(label: 'Branding'),
//                 SkillChip(label: 'Frontend Development'),
//                 SkillChip(label: 'Graphic Design'),
//               ],
//             ),
//             Expanded(child: Container()),
//             SizedBox(height: 16),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     // Action for button
//             //   },
//             //   child: Text('Find My Matches'),
//             //   style: ElevatedButton.styleFrom(
//             //     padding: EdgeInsets.symmetric(vertical: 16),
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(30), // Button circular
//             //     ),
//             //   ),
//             // ),
//             CustomButton(
//               text: "Find My Matches",
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

// class SkillChip extends StatelessWidget {
//   final String label;
//   final bool isSelected;

//   SkillChip({required this.label, this.isSelected = false});

//   @override
//   Widget build(BuildContext context) {
//     return ChoiceChip(
//       label: Text(label),
//       selected: isSelected,
//       onSelected: (bool selected) {
//         // Add selection logic here
//       },
//       labelStyle: TextStyle(
//         color: isSelected ? Colors.white : Colors.blue,
//         fontWeight: FontWeight.w500,
//       ),
//       selectedColor: Colors.blue,
//       backgroundColor: Colors.grey.shade200,
//       shape: StadiumBorder(), // Makes chip circular
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class SkillsScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const SkillsScreen({
    super.key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "What are you great at?",
        subtitle:
            "Select your top skills so the right companies\ncan find you.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search your skills',
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 14.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // smaller radius
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Select at least 3', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SkillChip(label: 'UI/UX Design'),
                SkillChip(label: 'Full stack Developer', isSelected: true),
                SkillChip(label: 'Product Design', isSelected: true),
                SkillChip(label: 'Marketing'),
                SkillChip(label: 'Animation'),
                SkillChip(label: 'Data Analytics'),
                SkillChip(label: 'Branding'),
                SkillChip(label: 'Frontend Development'),
                SkillChip(label: 'Graphic Design'),
              ],
            ),
            const Spacer(),
            const SizedBox(height: 16),
            CustomButton(
              text: "Find My Matches",
              onPressed: () {
                // Action for next button
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const SkillChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        // Add selection logic here
      },
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.blue,
        fontWeight: FontWeight.w500,
      ),
      selectedColor: Colors.blue.withOpacity(0.8), // slightly transparent
      backgroundColor: Colors.blue.withOpacity(0.1), // light transparent bg
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}
