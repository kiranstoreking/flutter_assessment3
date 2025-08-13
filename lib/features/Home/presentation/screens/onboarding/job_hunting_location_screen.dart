import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class JobHuntingScreen extends StatelessWidget {
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const JobHuntingScreen({super.key, this.onBack, required this.currentPage, required this.totalPages});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar:  IntroAppBar(
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text('Current Location', style: TextStyle(color: Colors.blue)),
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
                  borderSide: BorderSide.none,
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
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
              },
              child: Text('Next : Your Education'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // button height
              ),
            ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}