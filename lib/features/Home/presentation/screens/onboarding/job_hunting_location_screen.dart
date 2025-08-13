import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This helps us find amazing jobs in your preferred location.',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: AppColors.accentBlue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text(
                  'Current Location',
                  style: TextStyle(color: Colors.blue),
                ),
                subtitle: Text('Find jobs in your current city'),
                trailing: Icon(Icons.radio_button_checked, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Add your preferred location(s)?',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for your favourite city...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),

            SizedBox(height: 20),
            Wrap(
              spacing: 8,
              children: [
                _buildLocationButton('Delhi'),
                _buildLocationButton('Bengaluru'),
                _buildLocationButton('Mumbai'),
              ],
            ),
            Spacer(),
            CustomButton(text: "Next", onPressed: () {}),
            // Padding(padding: const EdgeInsets.only(bottom: 50.0)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationButton(String city) {
    return OutlinedButton(
      onPressed: () {
        // Add functionality for selecting city
      },
      child: Text(city, style: TextStyle(color: Colors.blue)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
