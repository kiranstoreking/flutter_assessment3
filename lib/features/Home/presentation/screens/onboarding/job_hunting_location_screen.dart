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
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/chips.dart';
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            const SizedBox(height: 12),

            // Current Location Card
            _locationCard(
              title: 'Current Location',
              subtitle: 'Find jobs in your current city',
              isSelected: true,
            ),

            const SizedBox(height: 28),
            Text(
              'Add your preferred location(s)',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.gray900,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            // Search Field
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search for your favourite city...',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(
                    12,
                  ), // icon padding inside square
                  child: Image.asset(AppAssets.search, height: 18, width: 18),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ), // single color
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ), // same as others
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromRGBO(0, 0, 0, 0.867),
              ),
            ),

            const SizedBox(height: 20),

            // Preferred Locations Chips
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Chips(
                  label: 'Delhi',
                  isSelected: true,
                  verticalPadding: 5,
                  horizontalPadding: 5,
                ),
                Chips(
                  label: 'Bengaluru',
                  verticalPadding: 5,
                  horizontalPadding: 5,
                ),
                Chips(
                  label: 'Mumbai',
                  verticalPadding: 5,
                  horizontalPadding: 5,
                ),
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
    required String title,
    required String subtitle,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        // gradient: isSelected
        //     ? const LinearGradient(
        //         colors: [Color(0xFF001EE6), Color(0xFF031BBB)],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       )
        //     : null,
        color: isSelected
            ? AppColors.accentBlue.withOpacity(0.5)
            : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.gray400,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            // gradient: isSelected
            //     ? LinearGradient(
            //         colors: [
            //           AppColors.primary.withOpacity(0.2),
            //           Colors.white.withOpacity(0.1),
            //         ],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //       )
            //     : null,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/location.png',
              color: AppColors.secondary,
              height: 24,
              width: 24,
            ),
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.gray800,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray600),
        ),
        trailing: Icon(
          isSelected
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}

//   Widget _buildLocationChip(String city, {bool isSelected = false}) {
//     return OutlinedButton(
//       onPressed: () {},
//       style: OutlinedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         side: BorderSide(
//           color: isSelected ? AppColors.secondary : AppColors.primary,
//           width: 1.5, // border width
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         backgroundColor: isSelected
//             ? AppColors.secondaryLight
//             : AppColors.white,
//       ),
//       child: Text(
//         city,
//         style: AppTextStyles.bodySmall.copyWith(
//           color: isSelected ? AppColors.secondary : AppColors.primary,
//         ),
//       ),
//     );
//   }
// }
