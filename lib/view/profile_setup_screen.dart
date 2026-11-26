
import 'package:bloodlink/constants/app_colors.dart';
import 'package:bloodlink/core/responsive.dart';
import 'package:bloodlink/view/blood_group_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_setup_controller.dart';

class ProfileSetupScreen extends StatelessWidget {
  ProfileSetupScreen({super.key});

  final ProfileSetupController controller =
      Get.put(ProfileSetupController());

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

              // 3. Profile Picture
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Reactive Profile Image
                  Obx(() {
                    final imageBytes =
                        controller.selectedImageBytes.value;

                    return CircleAvatar(
                      radius: Responsive.w(context, 70),

                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,

                      // Display image from saved bytes
                      backgroundImage: imageBytes != null
                          ? MemoryImage(imageBytes)
                          : null,

                      // Default avatar when no image exists
                      child: imageBytes == null
                          ? Icon(
                              Icons.person,
                              size: Responsive.w(context, 110),
                              color:
                                  theme.colorScheme.onSurfaceVariant,
                            )
                          : null,
                    );
                  }),

                  // Camera Button
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
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Responsive.w(context, 24),
                                vertical:
                                    Responsive.h(context, 56),
                              ),

                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Bottom Sheet Heading
                                  Text(
                                    'Choose Profile Picture',
                                    style: theme
                                        .textTheme.titleLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        Responsive.h(context, 20),
                                  ),

                                  // Camera Option
                                  GestureDetector(
                                    behavior:
                                        HitTestBehavior.opaque,

                                    onTap: () {
                                      Get.back();

                                      controller.pickImage(
                                        ImageSource.camera,
                                      );
                                    },

                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.camera_alt_outlined,
                                        ),

                                        SizedBox(
                                          width:
                                              Responsive.w(context, 27),
                                        ),

                                        const Text(
                                          "Take Picture from Camera",
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        Responsive.h(context, 26),
                                  ),

                                  // Gallery Option
                                  GestureDetector(
                                    behavior:
                                        HitTestBehavior.opaque,

                                    onTap: () {
                                      Get.back();

                                      controller.pickImage(
                                        ImageSource.gallery,
                                      );
                                    },

                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.photo_library_outlined,
                                        ),

                                        SizedBox(
                                          width:
                                              Responsive.w(context, 27),
                                        ),

                                        const Text(
                                          "Select Image from Gallery",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            backgroundColor:
                                theme.colorScheme.surface,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                  Responsive.w(context, 20),
                                ),
                              ),
                            ),
                          );
                        },

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
              TextField(
                controller: TextEditingController(
                  text: 'Ali Khan',
                ),

                style: theme.textTheme.bodyMedium,

                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.person_outline),

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

                controller: TextEditingController(
                  text: '15 Mar 2000',
                ),

                style: theme.textTheme.bodyMedium,

                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.calendar_month_outlined),

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

                controller: TextEditingController(
                  text: 'Male',
                ),

                style: theme.textTheme.bodyMedium,

                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.person_outline),

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
                controller: TextEditingController(
                  text: 'Karachi, Pakistan',
                ),

                style: theme.textTheme.bodyMedium,

                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.location_on_outlined),

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
