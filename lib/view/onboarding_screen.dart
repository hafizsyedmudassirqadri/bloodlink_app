import 'package:bloodlink/constants/app_colors.dart';
import 'package:bloodlink/controllers/onboarding_controller.dart';
import 'package:bloodlink/core/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final OnboardingController controller = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: Responsive.w(context, 24),
              vertical: Responsive.h(context, 16),
            ),
            child: Obx(() {
              return Column(
                children: [
                  // 1. Donation illustration
                  SizedBox(
                    width: double.infinity,
                    height: Responsive.h(context, 257),

                    child: Image.asset(
                      controller.images[controller.currentPage.value],
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: Responsive.h(context, 20)),
                  // 2. Heading

                  Text(
                    controller.titles[controller.currentPage.value],
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Responsive.h(context, 12)),

                  // 3. Description
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Responsive.w(context, 32),
                    ),
                    child: Text(
                      controller.descriptions[controller.currentPage.value],
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),

                  // 4. Flexible spacing
                  const Spacer(),

                  // 5. Progress Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _indicator(controller.currentPage.value == 0),
                      SizedBox(width: Responsive.w(context, 8)),
                      _indicator(controller.currentPage.value == 1),
                      SizedBox(width: Responsive.w(context, 8)),
                      _indicator(controller.currentPage.value == 2),
                    ],
                  ),
                  SizedBox(height: Responsive.h(context, 40)),
                  // 6. Next button
                  SizedBox(
                    width: double.infinity,
                    height: Responsive.h(context, 48),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Responsive.w(context, 10),
                          ),
                        ),
                      ),
                      onPressed: controller.nextPage,
                      child: Text(
                        controller.currentPage.value == 2 ? 'Get Started' : 'Next',

                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

Widget _indicator(bool active) {
  return Container(
    width: 7,
    height: 7,
    decoration: BoxDecoration(
      color: active ? AppColors.primary : Color(0xFF808080),
      shape: BoxShape.circle,
    ),
  );
}
