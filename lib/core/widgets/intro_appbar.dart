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
      toolbarHeight: 220,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Decorative background app icon
            Positioned(
              right: -20,
              bottom: 0,
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  AppAssets.appicon,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Back button - rounded square
            if (currentPage != 0)
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  elevation: 3,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),

            // Title & Subtitle
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.displaySmall.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white70,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Progress bar - only right end curved
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(8),
        child: Stack(
          children: [
            Container(height: 8, color: Colors.white24),
            LayoutBuilder(
              builder: (context, constraints) {
                double progressWidth =
                    constraints.maxWidth * ((currentPage + 1) / totalPages);
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 8,
                    width: progressWidth,
                    decoration: BoxDecoration(
                      color: AppColors.info,
                      borderRadius: const BorderRadius.horizontal(
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
  Size get preferredSize => const Size.fromHeight(228);
}
