import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';

class IntroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final int currentPage;
  final int totalPages;
  final VoidCallback? onBack;

  const IntroAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.totalPages,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 200,

      backgroundColor: Colors.transparent, // gradient will cover
      elevation: 0,
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Stack(
          children: [
            // Back button at top-left (only if not first page)
            if (currentPage != 0)
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 8,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: onBack ?? () => Navigator.pop(context),
                ),
              ),

            // Image at bottom
            Positioned(
              right: 16, // move it to the right side
              bottom: 16, // keep it near the bottom
              child: Image.asset(
                AppAssets.appicon,
                height: 176, // larger size
                width: 170,
                fit: BoxFit.contain,
              ),
            ),

            // Text over image
            Positioned(
              left: 16,
              bottom: 16 + 50, // leave space so it's above image
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.displayLarge),
                  SizedBox(height: 10),
                  Text(subtitle, style: AppTextStyles.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(8),
        child: LinearProgressIndicator(
          minHeight: 8,
          value: (currentPage + 1) / totalPages,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(208);
}
