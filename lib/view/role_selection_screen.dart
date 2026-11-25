import 'package:bloodlink/view/profile_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/responsive.dart';
import '../controllers/role_selection_controller.dart';
import '../widgets/role_option_card.dart';

class RoleSelectionScreen extends StatelessWidget {
  RoleSelectionScreen({super.key});

  final RoleSelectionController controller = Get.put(RoleSelectionController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 22),
            vertical: Responsive.h(context, 24),
          ),

          child: Column(
            children: [
              SizedBox(height: Responsive.h(context, 40)),

              // 1. Main heading
              Text(
                'How will you use\nBloodLink?',
                textAlign: TextAlign.center,

                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.sp(context, 26),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(context, 12)),

              // 2. Description
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.w(context, 24),
                ),

                child: Text(
                  'You can donate blood, request blood, '
                  'or do both anytime.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              SizedBox(height: Responsive.h(context, 38)),

              // 3. Role options
              Obx(
                () => Column(
                  children: [
                    // Donate Blood
                    RoleOptionCard(
                      title: 'Donate Blood',

                      description: 'Help patients in need\nby donating blood.',

                      imagePath: 'assets/role selection/heart.png',

                      isSelected: controller.selectedRole.value == 0,

                      onTap: () {
                        controller.selectRole(0);
                      },
                    ),

                    SizedBox(height: Responsive.h(context, 14)),

                    // Request Blood
                    RoleOptionCard(
                      title: 'Request Blood',

                      description:
                          'Create blood requests\nfor yourself or family.',

                      imagePath: 'assets/role selection/drop.png',

                      isSelected: controller.selectedRole.value == 1,

                      onTap: () {
                        controller.selectRole(1);
                      },
                    ),

                    SizedBox(height: Responsive.h(context, 14)),

                    // Both
                    RoleOptionCard(
                      title: 'Both (Recommended)',

                      description:
                          'Donate blood and also\n'
                          'create blood requests\n'
                          'when needed.',

                      imagePath: 'assets/role selection/users.png',

                      isSelected: controller.selectedRole.value == 2,

                      onTap: () {
                        controller.selectRole(2);
                      },
                    ),
                  ],
                ),
              ),

              // 4. Push button to bottom
              const Spacer(),

              // 5. Continue button
              SizedBox(
                width: double.infinity,
                height: Responsive.h(context, 44),

                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => ProfileSetupScreen());
                    controller.continueNext();
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
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
            ],
          ),
        ),
      ),
    );
  }
}
