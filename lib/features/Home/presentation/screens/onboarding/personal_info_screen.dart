import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class UserInfoScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const UserInfoScreen({
    Key? key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  // Common decoration for all text fields
  InputDecoration _inputDecoration({
    required String label,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: AppTextStyles.titleSmall,
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // rounded corners
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "Hey there! Let's get to know you.",
        subtitle:
            "This helps us find jobs that are a perfect fit,\njust for you.",
        currentPage: currentPage,
        totalPages: totalPages,
        onBack: onBack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // changed to scrollable in case of small screens
          children: [
            // First Name
            _labelWithAsterisk("First Name"),
            TextField(
              cursorColor: Colors.grey,
              decoration: _inputDecoration(label: 'Enter your first name'),
            ),
            const SizedBox(height: 20),

            // Last Name
            _labelWithAsterisk("Last Name"),
            TextField(
              cursorColor: Colors.grey,
              decoration: _inputDecoration(label: 'Enter your last name'),
            ),
            const SizedBox(height: 20),

            // Gender
            _labelWithAsterisk("Gender"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _genderOption(AppAssets.maleIcon, "Male"),
                _genderOption(AppAssets.femaleIcon, "Female"),
                _genderOption(AppAssets.otherIcon, "Other"),
              ],
            ),
            const SizedBox(height: 20),

            // Date of Birth
            _labelWithAsterisk("Date of Birth"),
            TextField(
              cursorColor: Colors.grey,
              readOnly: true,
              decoration: _inputDecoration(
                label: 'Select your date of birth',
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                // TODO: Implement date picker logic here
              },
            ),
            Spacer(),

            // Submit Button
            CustomButton(text: "Next", onPressed: () {}),
            // Padding(padding: const EdgeInsets.only(bottom: 50.0)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  /// Widget for label + red asterisk
  Widget _labelWithAsterisk(String label) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppTextStyles.titleSmall.copyWith(color: AppColors.gray700),
          ),
          TextSpan(
            text: " *",
            style: AppTextStyles.titleSmall.copyWith(color: AppColors.error),
          ),
        ],
      ),
    );
  }

  /// Gender selection option widget
  Widget _genderOption(String iconPath, String label) {
    return Column(
      children: [
        Image.asset(iconPath, height: 50, width: 50),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.titleSmall.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
