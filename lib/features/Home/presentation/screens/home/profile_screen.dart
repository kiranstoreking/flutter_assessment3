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
      // appBar: AppBar(title: Text('Profile'), backgroundColor: Colors.blue),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildUserInfo(),
            SizedBox(height: 20),
            _buildSkillsSection(),
            SizedBox(height: 20),
            _buildResumeSection(),
            SizedBox(height: 20),
            _buildActivitySection(),
            SizedBox(height: 20),
            _buildGeneralSection(context),
            SizedBox(height: 20),
            CustomButton(onPressed: () {}, text: "Logout"),
          ],
        ),
      ),
    );
  }

  // User Info Section
  Widget _buildUserInfo() {
    return Container(
      height: 127,
      color: Colors.transparent, // important to allow gradient to show
      child: Container(
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
          borderRadius: BorderRadius.circular(12), // match Card border radius
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shubham Jaiswal', style: AppTextStyles.labelMedium),
                  Image.asset(AppAssets.rightArrowIcon, height: 20, width: 20),
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
        ),
      ),
    );
  }

  // Skills Section
  Widget _buildSkillsSection() {
    // Color(0xff60A5FA), Color(0xffBFDBFE)
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          // colors: [Color(0xff60A5FA), Color(0xffBFDBFE),],
          colors: [Color(0xffEBF4FF), Color(0xffFFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      // elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.skillsIocns, height: 50, width: 50),
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

                Image.asset(AppAssets.leftshiftArrow, height: 12.5, width: 7.5),
              ],
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Chip(
                  label: Text('UI/UX Design'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ), // makes it fully rounded
                  ),
                  backgroundColor:
                      Colors.blue.shade100, // optional: background color
                ),
                Chip(
                  label: Text('Fullstack Developer'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
                Chip(
                  label: Text('Marketing'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
                Chip(
                  label: Text('Illustration'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
                Chip(
                  label: Text('Product Design'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
                Chip(
                  label: Text('+ 10 more'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue.shade100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Resume Section
  Widget _buildResumeSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          // colors: [Color(0xff60A5FA), Color(0xffBFDBFE),],
          colors: [Color(0xffEBF4FF), Color(0xffFFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
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
            Image.asset(AppAssets.resumeIcon, height: 60, width: 60),
          ],
        ),
      ),
    );
  }

  // Activity Section
  Widget _buildActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Activity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildActivityTile('Active Applications', AppAssets.jobIcon),
        _buildActivityTile('Job Preferences', AppAssets.preferencesIcon),
        _buildActivityTile('Enrolled Courses', AppAssets.graduationCapIcon),
        _buildActivityTile('Attended Webinars', AppAssets.webinarsIcon),
      ],
    );
  }

  // Activity Tile
  Widget _buildActivityTile(String title, String imagePaths) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      // elevation: 3,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8), // spacing between cards
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imagePaths, height: 44, width: 44),
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
                  TextSpan(text: 'Collection', style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            Image.asset(AppAssets.leftshiftArrow, height: 12.5, width: 7.5),
          ],
        ),
      ),
    );
  }

  // General Section
  Widget _buildGeneralSection(BuildContext context) {
    return Container(
      color: Colors.transparent, // Makes the card background transparent
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildGeneralTile('Account settings', AppAssets.userRoundCogIcon),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditProfileScreen()),
                );
              },
              child: _buildGeneralTile('Help & Feedback', AppAssets.infoIcon),
            ),
          ],
        ),
      ),
    );
  }

  // General Tile
  Widget _buildGeneralTile(String title, String imagePaths) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              color: AppColors.info,
              child: Image.asset(imagePaths, height: 10, width: 10),
            ),
            SizedBox(width: 10),

            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Image.asset(AppAssets.leftshiftArrow, height: 12.5, width: 7.5),
      ],
    );
  }

  // Logout Button
  Widget _buildLogoutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Logout action
        },
        child: Text('Log out'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      ),
    );
  }
}
