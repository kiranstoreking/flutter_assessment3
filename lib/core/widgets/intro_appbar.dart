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
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Stack(
          children: [
            if (currentPage != 0)
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  color: AppColors.white,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: onBack ?? () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Image.asset(
                AppAssets.appicon,
                height: 176,
                width: 170,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 150,
              left: 16,
              width: 340,
              height: 74,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.displayLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: AppTextStyles.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
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
          backgroundColor: AppColors.gray600,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.info),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(208);
}
