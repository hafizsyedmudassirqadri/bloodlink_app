import 'package:bloodlink/core/responsive.dart';
import 'package:flutter/material.dart';

import '../widgets/theme_toggle.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(
    SplashController(),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // 1. logo, title and tagline
          SafeArea(
            child: Center(
              child: Align(
                alignment: Alignment(0, -0.35),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Image.asset(
                      isDark
                          ? 'assets/splash/logo-dark.png'
                          : 'assets/splash/logo-light.png',

                      width: Responsive.w(context, 100),
                      height: Responsive.h(context, 100),
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: Responsive.h(context, 20)),
                    RichText(
                      text: TextSpan(
                        text: "Blood",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),

                        children: [
                          TextSpan(
                            text: "Link",
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 8)),

                    Text(
                      "Connecting Donors, Saving Lives.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Bottom wave
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/splash/wave.png",
              width: Responsive.width(context),
              height: Responsive.h(context, 250),
              fit: BoxFit.fill,
            ),
          ),

          // 3. Heartbeat above wave
          Positioned(
            left: 0,
            right: 0,
            bottom: Responsive.h(context, 110),
            child: Image.asset(
              "assets/splash/heart.png",
              width: Responsive.w(context, 230),
              height: Responsive.h(context, 125),
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: MediaQuery.paddingOf(context).top + Responsive.h(context, 12),
            right: Responsive.w(context, 16),

            child: const ThemeToggle(),
          ),
        ],
      ),
    );
  }
}
