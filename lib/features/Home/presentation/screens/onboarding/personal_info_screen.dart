import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
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
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "First Name", style: AppTextStyles.titleSmall),
                  TextSpan(
                    text: "*",
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your first name',
                labelStyle: AppTextStyles.titleSmall,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "First Name", style: AppTextStyles.titleSmall),
                  TextSpan(
                    text: "*",
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your first name',
                labelStyle: AppTextStyles.titleSmall,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Gender *", style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [Image.asset(AppAssets.maleIcon), Text('Male')],
                  ),
                ),

                Container(
                  child: Column(
                    children: [Image.asset(AppAssets.femaleIcon), Text('Male')],
                  ),
                ),

                Container(
                  child: Column(
                    children: [Image.asset(AppAssets.otherIcon), Text('Male')],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Date of Birth",
                    style: AppTextStyles.titleSmall,
                  ),
                  TextSpan(
                    text: "*",
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your first name',
                labelStyle: AppTextStyles.titleSmall,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(
                  "Let's Begin",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
