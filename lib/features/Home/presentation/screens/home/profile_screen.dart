import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/custom_button.dart';
import 'package:flutter_assignment3/features/Home/presentation/screens/home/edit_profile_screen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildUserInfo(),
            SizedBox(height: 20),
            _sectionWrapper(_buildSkillsSection()),
            SizedBox(height: 20),
            _sectionWrapper(_buildResumeSection()),
            SizedBox(height: 20),
            _sectionTitle("My Activity"),
            _sectionWrapper(_buildActivitySection()),
            SizedBox(height: 20),
            _sectionTitle("General"),
            _sectionWrapper(_buildGeneralSection(context)),
            SizedBox(height: 20),
            CustomButton(onPressed: () {}, text: "Logout"),
          ],
        ),
      ),
    );
  }

  // Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
      child: Text(title, style: AppTextStyles.bodyLarge),
    );
  }

  // Wrapper to give uniform style to each section
  Widget _sectionWrapper(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }

  // User Info Section
  Widget _buildUserInfo() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff001EE6),
            Color(0xff031BBB),
            Color(0xff0117AF),
            Color(0xff00138F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shubham Jaiswal', style: AppTextStyles.labelMedium),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
          SizedBox(height: 6),
          Text(
            'CNC Programmer • Bengaluru • 2yr Exp',
            style: AppTextStyles.labelSmall,
          ),
          SizedBox(height: 15),
          Text('+919434789344', style: AppTextStyles.labelSmall),
          SizedBox(height: 6),
          Text('shubham1004@gmail.com', style: AppTextStyles.labelSmall),
        ],
      ),
    );
  }

  // Skills Section
  Widget _buildSkillsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _iconBox(AppAssets.skillsIocns),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'My Skill ',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Collection',
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.primary),
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _skillChip('UI/UX Design'),
              _skillChip('Fullstack Developer'),
              _skillChip('Marketing'),
              _skillChip('Illustration'),
              _skillChip('Product Design'),
              _skillChip('+ 10 more'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: Colors.blue.shade100,
    );
  }

  Widget _iconBox(String assetPath) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: AppColors.info.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }

  // Resume Section
  Widget _buildResumeSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ATS Compliant Resume',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('Our AI will help you create one ✚'),
            ],
          ),
          _iconBox(AppAssets.resumeIcon),
        ],
      ),
    );
  }

  // Activity Section
  Widget _buildActivitySection() {
    final activities = [
      ['Active Applications', AppAssets.jobIcon],
      ['Job Preferences', AppAssets.preferencesIcon],
      ['Enrolled Courses', AppAssets.graduationCapIcon],
      ['Attended Webinars', AppAssets.webinarsIcon],
    ];

    return Column(
      children: activities.map((e) => _tileItem(e[0], e[1])).toList(),
    );
  }

  // General Section
  Widget _buildGeneralSection(BuildContext context) {
    return Column(
      children: [
        _tileItem('Account settings', AppAssets.userRoundCogIcon),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => EditProfileScreen()),
            );
          },
          child: _tileItem('Help & Feedback', AppAssets.infoIcon),
        ),
      ],
    );
  }

  Widget _tileItem(String title, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _iconBox(iconPath),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.primary),
        ],
      ),
    );
  }
}
