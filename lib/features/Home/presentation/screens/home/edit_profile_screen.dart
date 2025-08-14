import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.transparent,
        titleSpacing: 0, // keep zero so padding works perfectly
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ), // same as body padding
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppAssets.leftArrowIcon,
                    height: 18,
                    width: 18,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text('Edit Profile', style: AppTextStyles.bodyLarge),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryLight, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      AppAssets.profileImage,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shubham Jaiswal',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'CNC Programmer',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        AppAssets.pencilIcon,
                        height: 22,
                        width: 22,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Update your profile', style: AppTextStyles.bodyMedium),
            SizedBox(height: 16),

            // Profile Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 15),
                children: [
                  ProfileItem(
                    title: 'About me',
                    subtitle: 'Introduce yourselves in a few lines',
                    imagePaths: AppAssets.userRoundIcon,
                  ),
                  ProfileItem(
                    title: 'Skills',
                    subtitle: 'Highlight your top abilities',
                    imagePaths: AppAssets.skillsIocns,
                  ),
                  ProfileItem(
                    title: 'Experience',
                    subtitle: 'Add your work journey',
                    imagePaths: AppAssets.briefcaseIcon,
                  ),
                  ProfileItem(
                    title: 'Education',
                    subtitle: 'List your degrees and institutions',
                    imagePaths: AppAssets.graduationCapIcon,
                  ),
                  ProfileItem(
                    title: 'Projects',
                    subtitle: 'Showcase your best work',
                    imagePaths: AppAssets.projects,
                  ),
                  ProfileItem(
                    title: 'Awards & Certifications',
                    subtitle: 'Mention honors or recognitions',
                    imagePaths: AppAssets.awardsAndCertification,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePaths;

  const ProfileItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(imagePaths, fit: BoxFit.contain),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),
                SizedBox(height: 3),
                Text(
                  subtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AppAssets.plusIcon, height: 18, width: 18),
        ],
      ),
    );
  }
}
