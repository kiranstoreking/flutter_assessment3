import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_assignment3/core/constants/app_assets.dart';
import 'package:flutter_assignment3/core/theme/app_colors.dart';
import 'package:flutter_assignment3/core/theme/app_text_styles.dart';
import 'package:flutter_assignment3/core/widgets/intro_appbar.dart';
import 'package:lottie/lottie.dart';

// Star Widget
class Star extends StatelessWidget {
  final double size;
  final Color color;

  const Star({Key? key, required this.size, required this.color})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size), painter: _StarPainter(color));
  }
}

class _StarPainter extends CustomPainter {
  final Color color;
  _StarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    final w = size.width;
    final h = size.height;
    final halfW = w / 2;
    final halfH = h / 2;
    final radius = min(halfW, halfH);

    for (int i = 0; i < 5; i++) {
      double angle = (i * 72 - 90) * pi / 180;
      double x = halfW + radius * cos(angle);
      double y = halfH + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      angle = ((i + 0.5) * 72 - 90) * pi / 180;
      x = halfW + radius / 2 * cos(angle);
      y = halfH + radius / 2 * sin(angle);
      path.lineTo(x, y);
    }
    path.close();

    canvas.drawShadow(path, Colors.yellowAccent, 2, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WelcomeScreen extends StatefulWidget {
  final String userName;
  final VoidCallback? onBack;
  final int currentPage;
  final int totalPages;

  const WelcomeScreen({
    Key? key,
    required this.userName,
    this.onBack,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _textController;
  late AnimationController _sparkleController;

  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textController.dispose();
    _sparkleController.dispose();
    super.dispose();
  }

  // Floating stars
  List<Widget> _buildStars() {
    return List.generate(12, (index) {
      final left = _random.nextDouble() * MediaQuery.of(context).size.width;
      final top = _random.nextDouble() * 300;
      final size = _random.nextDouble() * 10 + 4;

      return AnimatedBuilder(
        animation: _sparkleController,
        builder: (context, child) {
          return Positioned(
            left: left,
            top: top + 10 * sin(_sparkleController.value * 2 * pi),
            child: Star(size: size, color: Colors.red.withOpacity(0.9)),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: IntroAppBar(
        title: "You're all set!",
        subtitle: "We're already searching for jobs that match\nyour profile.",
        currentPage: widget.currentPage,
        totalPages: widget.totalPages,
        onBack: widget.onBack,
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(width: double.infinity, height: double.infinity),

          // Floating stars
          ..._buildStars(),

          // Center content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Layered Lottie Animations with halo
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Bottom Lottie (larger)
                        RotationTransition(
                          turns: Tween<double>(begin: 0, end: 0.05).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                              CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.elasticOut,
                              ),
                            ),
                            child: Lottie.asset(
                              AppAssets.celebrate,
                              repeat: true,
                            ),
                          ),
                        ),

                        // Top Lottie (smaller)
                        RotationTransition(
                          turns: Tween<double>(begin: 0, end: -0.03).animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOut,
                            ),
                          ),
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.85, end: 0.95)
                                .animate(
                                  CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.elasticOut,
                                  ),
                                ),
                            child: Lottie.asset(
                              AppAssets.celebrate1,
                              repeat: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),

                    // Animated Text
                    ScaleTransition(
                      scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _textController,
                          curve: Curves.easeOutBack,
                        ),
                      ),
                      child: SlideTransition(
                        position:
                            Tween<Offset>(
                              begin: const Offset(0, 0.3),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _textController,
                                curve: Curves.easeOut,
                              ),
                            ),
                        child: FadeTransition(
                          opacity: _textController,
                          child: Column(
                            children: [
                              Text(
                                "Glad to have you,",
                                style: AppTextStyles.displayMedium.copyWith(
                                  fontSize: 24,
                                  color: AppColors.gray800,
                                  fontWeight: FontWeight.bold,
                                  shadows: [],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.userName,
                                style: AppTextStyles.displaySmall.copyWith(
                                  fontSize: 24,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                  shadows: [],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 64),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
