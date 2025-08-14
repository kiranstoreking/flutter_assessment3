import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: Image.asset(AppAssets.leftArrowIcon),
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
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 30),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shubham Jaiswal',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'CNC Programmer',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.white),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Update your profile', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            // List of Profile Sections
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imagePaths),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title), Text(subtitle)],
              ),
            ],
          ),
          Image.asset(AppAssets.plusIcon, height: 18, width: 18),
        ],
      ),
    );
  }
}
