import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';

class SkillsScreen extends StatelessWidget {
    final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const SkillsScreen({super.key, this.onBack, required this.currentPage, required this.totalPages});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  IntroAppBar(
        title: "What are you great at?",
        subtitle: "Select your top skills so the right companies can find you.",
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
              'Select your top skills so the right companies can find you.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search your skills',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Select at least 3', style: TextStyle(fontSize: 14)),
            SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SkillChip(label: 'UI/UX Design'),
                SkillChip(label: 'Full stack Developer', isSelected: true),
                SkillChip(label: 'Product Design', isSelected: true),
                SkillChip(label: 'Marketing'),
                SkillChip(label: 'Animation'),
                SkillChip(label: 'Data Analytics'),
                SkillChip(label: 'Branding'),
                SkillChip(label: 'Frontend Development'),
                SkillChip(label: 'Graphic Design'),
              ],
            ),
            Expanded(child: Container()),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Action for button
              },
              child: Text('Find My Matches'),
              style: ElevatedButton.styleFrom(
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  SkillChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        // Add selection logic here
      },
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.blue),
      selectedColor: Colors.blue,
      backgroundColor: Colors.transparent,
    );
  }
}