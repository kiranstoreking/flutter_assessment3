import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';

class EducationalOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final String imagePaths;
  final ValueChanged<bool?>? onChanged;

  const EducationalOption({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    required this.imagePaths,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary, width: 1),
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? AppColors.secondaryLight : Colors.white,
      ),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight, // light background
            borderRadius: BorderRadius.circular(8), // square with rounded edges
          ),
          child: Center(
            child: Image.asset(
              imagePaths,
              height: 28,
              width: 28,
              fit: BoxFit.contain,
            ),
          ),
        ),

        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        trailing: Radio<bool>(
          value: true,
          groupValue: isSelected,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
        onTap: () {
          if (onChanged != null) onChanged!(!isSelected);
        },
      ),
    );
  }
}
