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

  static const double _screenPadding = 16.0;
  static const double _fieldSpacing = 20.0;
  static const double _labelSpacing = 8.0;

  const UserInfoScreen({
    Key? key,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

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
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(_screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _labelWithAsterisk("First Name"),
                  const SizedBox(height: _labelSpacing),
                  TextField(
                    cursorColor: Colors.grey,
                    decoration: _inputDecoration(
                      label: 'Enter your first name',
                    ),
                  ),
                  const SizedBox(height: _fieldSpacing),

                  _labelWithAsterisk("Last Name"),
                  const SizedBox(height: _labelSpacing),
                  TextField(
                    cursorColor: Colors.grey,
                    decoration: _inputDecoration(label: 'Enter your last name'),
                  ),
                  const SizedBox(height: _fieldSpacing),

                  _labelWithAsterisk("Gender"),
                  const SizedBox(height: _labelSpacing),
                  Row(
                    children: [
                      _genderOption(AppAssets.maleIcon, "Male"),
                      _genderOption(AppAssets.femaleIcon, "Female"),
                      _genderOption(AppAssets.otherIcon, "Other"),
                    ],
                  ),
                  const SizedBox(height: _fieldSpacing),

                  _labelWithAsterisk("Date of Birth"),
                  const SizedBox(height: _labelSpacing),
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
                      // TODO: Implement date picker
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(text: "Let’s Begin", onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(_screenPadding),
      child: child,
    );
  }

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

  Widget _genderOption(String iconPath, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // TODO: Handle gender selection
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Image.asset(iconPath, height: 24, width: 24),
              const SizedBox(height: 6),
              Text(
                label,
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.gray700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
