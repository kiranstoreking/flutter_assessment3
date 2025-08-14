// import 'package:flutter/material.dart';
// import 'package:flutter_assignment3/core/theme/app_colors.dart';
// import 'package:flutter_assignment3/core/widgets/custom_button.dart';
// import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

// class JobHuntingScreen extends StatelessWidget {
//   final VoidCallback? onBack;
//   final int currentPage;
//   final int totalPages;

//   const JobHuntingScreen({
//     super.key,
//     this.onBack,
//     required this.currentPage,
//     required this.totalPages,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: IntroAppBar(
//         title: "Where are you job hunting?",
//         subtitle: "This helps us find amazing jobs in your preferred location.",
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
//               'This helps us find amazing jobs in your preferred location.',
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(height: 20),
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.accentBlue,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.blue),
//               ),
//               child: ListTile(
//                 leading: Icon(Icons.location_on, color: Colors.blue),
//                 title: Text(
//                   'Current Location',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//                 subtitle: Text('Find jobs in your current city'),
//                 trailing: Icon(Icons.radio_button_checked, color: Colors.blue),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Add your preferred location(s)?',
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search for your favourite city...',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(color: Colors.black, width: 2),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),
//             Wrap(
//               spacing: 8,
//               children: [
//                 _buildLocationButton('Delhi'),
//                 _buildLocationButton('Bengaluru'),
//                 _buildLocationButton('Mumbai'),
//               ],
//             ),
//             Spacer(),
//             CustomButton(text: "Next : Your Education", onPressed: () {}),
//             // Padding(padding: const EdgeInsets.only(bottom: 50.0)),
//             SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLocationButton(String city) {
//     return OutlinedButton(
//       onPressed: () {
//         // Add functionality for selecting city
//       },
//       child: Text(city, style: TextStyle(color: Colors.blue)),
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(color: Colors.blue),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class JobHuntingScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const JobHuntingScreen({
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
        title: "Where are you job hunting?",
        subtitle: "This helps us find amazing jobs in your preferred location.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              'Current Location',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 12),

            // Current Location Card
            _locationCard(
              icon: Icons.location_on,
              title: 'Current Location',
              subtitle: 'Find jobs in your current city',
              isSelected: true,
            ),

            const SizedBox(height: 28),
            Text(
              'Add your preferred location(s)',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 8),

            // Search Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for your favourite city...',
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.gray700,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.gray700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Preferred Locations Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildLocationChip('Delhi'),
                _buildLocationChip('Bengaluru'),
                _buildLocationChip('Mumbai'),
              ],
            ),

            const Spacer(),
            CustomButton(text: "Next : Your Education", onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _locationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isSelected = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.accentBlue.withOpacity(0.1)
            : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.gray700,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, color: AppColors.primary),
        title: Text(
          title,
          style: AppTextStyles.titleSmall.copyWith(color: AppColors.primary),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.gray600),
        ),
        trailing: Icon(
          isSelected
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildLocationChip(String city) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        side: BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        city,
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary),
      ),
    );
  }
}
