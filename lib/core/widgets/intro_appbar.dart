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
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Decorative background app icon
            Positioned(
              right: -40,
              bottom: -20,
              child: Opacity(
                opacity: 0.12,
                child: Image.asset(
                  AppAssets.appicon,
                  height: 220,
                  width: 220,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Back button - rounded square with shadow
            if (currentPage != 0)
              Positioned(
                top: MediaQuery.of(context).padding.top + 12,
                left: 16,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  elevation: 4,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),

            // Title & Subtitle
            Positioned(
              left: 20,
              right: 20,
              bottom: 36,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.displaySmall.copyWith(
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Progress bar - curved only at right end
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(12),
        child: Stack(
          children: [
            // Background track
            Container(height: 9, color: AppColors.gray400),
            // Progress indicator
            LayoutBuilder(
              builder: (context, constraints) {
                double progressWidth =
                    constraints.maxWidth * ((currentPage + 1) / totalPages);
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 9,
                    width: progressWidth,
                    decoration: const BoxDecoration(
                      color: AppColors.info,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(220);
}
