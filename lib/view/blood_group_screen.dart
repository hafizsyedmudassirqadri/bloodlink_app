import 'package:bloodlink/view/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../core/responsive.dart';
import '../controllers/blood_group_controller.dart';

class BloodGroupScreen extends StatelessWidget {
  BloodGroupScreen({super.key});

  final BloodGroupController controller = Get.put(BloodGroupController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 24),
            vertical: Responsive.h(context, 20),
          ),

          child: Column(
            children: [
              SizedBox(height: Responsive.h(context, 25)),

              // 1. Heading
              Text(
                'Select Blood Group',
                textAlign: TextAlign.center,

                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.sp(context, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(context, 24)),

              // 2. Description
              Text(
                'Choose your blood group to help us\n'
                'find the right matches.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),

              SizedBox(height: Responsive.h(context, 95)),

              // 3. Blood group grid
              Obx(
                () => Column(
                  children: [
                    // Row 1
                    Row(
                      children: [
                        bloodGroupCard(context, 'A+', isDark),
                        SizedBox(width: Responsive.w(context, 12)),
                        bloodGroupCard(context, 'A-', isDark),
                        SizedBox(width: Responsive.w(context, 12)),
                        bloodGroupCard(context, 'B+', isDark),
                      ],
                    ),

                    SizedBox(height: Responsive.h(context, 16)),

                    // Row 2
                    Row(
                      children: [
                        bloodGroupCard(context, 'B-', isDark),
                        SizedBox(width: Responsive.w(context, 12)),
                        bloodGroupCard(context, 'AB+', isDark),
                        SizedBox(width: Responsive.w(context, 12)),
                        bloodGroupCard(context, 'AB-', isDark),
                      ],
                    ),

                    SizedBox(height: Responsive.h(context, 16)),

                    // Row 3
                    Row(
                      children: [
                        bloodGroupCard(context, 'O+', isDark),
                        SizedBox(width: Responsive.w(context, 12)),
                        bloodGroupCard(context, 'O-', isDark),
                        SizedBox(width: Responsive.w(context, 12)),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // 4. Continue Button
              SizedBox(
                width: double.infinity,
                height: Responsive.h(context, 48),

                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => MainNavigationScreen());
                    controller.continueNext();
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.w(context, 10),
                      ),
                    ),
                  ),

                  child: Text(
                    'Continue',

                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(context, 10)),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable blood group card
  Widget bloodGroupCard(BuildContext context, String group, bool isDark) {
    final theme = Theme.of(context);

    final bool isSelected = controller.selectedGroup.value == group;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          controller.selectGroup(group);
        },

        child: Container(
          height: Responsive.h(context, 90),

          alignment: Alignment.center,

          decoration: BoxDecoration(
            color: isSelected
                ? (isDark ? const Color(0xFF47252E) : const Color(0xFFFFE8EC))
                : theme.colorScheme.surface,

            borderRadius: BorderRadius.circular(Responsive.w(context, 12)),

            border: Border.all(
              color: isSelected ? AppColors.primary : theme.dividerColor,
              width: 1,
            ),
          ),

          child: Stack(
            children: [
              Center(
                child: Text(
                  group,

                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: Responsive.sp(context, 26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              if (isSelected)
                Positioned(
                  top: Responsive.h(context, 5),
                  right: Responsive.w(context, 5),

                  child: Container(
                    width: Responsive.w(context, 20),
                    height: Responsive.w(context, 20),

                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: Responsive.sp(context, 14),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
