import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // remove default padding
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.transparent, // transparent to show gradient
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.topCenter, // 0deg → top
              end: Alignment.bottomCenter, // 360deg → bottom
              colors: [
                Color(0xFF001EE6), // #001EE6
                Color(0xFF031BBB), // #031BBB
                Color(0xFF0117AF), // #0117AF
                Color(0xFF00138F), // #00138F
              ],
              stops: [0.0, 0.3317, 0.6587, 1.0], // corresponding stops
            ),
          ),

          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: AppColors.white, // white text color
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 15),

                Image.asset(
                  AppAssets.rightArrowIcon,
                  height: 20,
                  width: 20,
                  color: Colors.white, // makes icon white
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
