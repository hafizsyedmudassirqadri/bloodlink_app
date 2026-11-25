import 'package:bloodlink/constants/app_colors.dart';
import 'package:bloodlink/core/responsive.dart';
import 'package:bloodlink/view/blood_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 24),
            vertical: Responsive.h(context, 20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Responsive.h(context, 20)),
              // 1. Heading
              Text(
                "Set Up Your Profile",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.sp(context, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(context, 14)),

              // 2. Description
              Text(
                'Complete your profile to get\nbetter matches.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: Responsive.h(context, 28)),
              // 3. Profile picture
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: Responsive.w(context, 70),
                    backgroundImage: const AssetImage(
                      'assets/profile setup/avatar ali.png',
                    ),
                  ),
                  // Camera button
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: Responsive.h(context, 42),
                      width: Responsive.w(context, 42),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.scaffoldBackgroundColor,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: Responsive.sp(context, 22),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Responsive.h(context, 36)),
              // 4. Full Name
              // 4. Full Name
              TextField(
                controller: TextEditingController(text: 'Ali Khan'),
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive.w(context, 12),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(context, 20)),

              // 5. Date of Birth
              TextField(
                readOnly: true,
                controller: TextEditingController(text: '15 Mar 2000'),
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_month_outlined),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive.w(context, 12),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(context, 20)),

              // 6. Gender
              TextField(
                readOnly: true,
                controller: TextEditingController(text: 'Male'),
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive.w(context, 12),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(context, 20)),

              // 7. Location
              TextField(
                controller: TextEditingController(text: 'Karachi, Pakistan'),
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  filled: true,
                  fillColor: theme.colorScheme.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Responsive.w(context, 12),
                    ),
                  ),
                ),
              ),

              const Spacer(),
              // 8. Continue Button
              SizedBox(
                width: double.infinity,
                height: Responsive.h(context, 48),

                child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => BloodGroupScreen());
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
}
