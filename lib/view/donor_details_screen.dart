import 'package:bloodlink/view/chat_screen.dart';
import 'package:bloodlink/view/request_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../core/responsive.dart';
import '../controllers/donor_details_controller.dart';
import '../controllers/navigation_controller.dart';

class DonorDetailsScreen extends StatelessWidget {
  final Map<String, String> donor;

  DonorDetailsScreen({super.key, required this.donor});

  final DonorDetailsController controller = Get.put(DonorDetailsController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final name = donor['name'] ?? 'Donor';
    final group = donor['group'] ?? '—';
    final distance = donor['km'] ?? '—';
    final donations = donor['donations'] ?? '—';
    final isAvailable = donor['status'] == 'Available';
    final isVerified = donor['verified'] == 'true';

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 18),
            vertical: Responsive.h(context, 12),
          ),

          child: Column(
            children: [
              // 1. DONOR PORTRAIT
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Responsive.w(context, 14),
                    ),

                    child: Image.asset(
                      donor['portrait']!,
                      width: double.infinity,
                      height: Responsive.h(context, 205),
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Back button
                  Positioned(
                    top: Responsive.h(context, 8),
                    left: Responsive.w(context, 8),

                    child: IconButton(
                      onPressed: () {
                        Get.find<NavigationController>().backToDonors();
                      },

                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black45,
                      ),

                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: Responsive.h(context, 18)),

              // 2. DONOR NAME
              Text(
                name,
                textAlign: TextAlign.center,

                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.sp(context, 25),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(context, 5)),

              // 3. VERIFIED DONOR
              if (isVerified)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: AppColors.success,
                      size: Responsive.sp(context, 18),
                    ),

                    SizedBox(width: Responsive.w(context, 4)),

                    Text(
                      'Verified Donor',

                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),

              SizedBox(height: Responsive.h(context, 12)),

              // 4. AVAILABILITY
              Container(
                width: Responsive.w(context, 130),
                padding: EdgeInsets.symmetric(
                  vertical: Responsive.h(context, 7),
                ),

                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,

                  borderRadius: BorderRadius.circular(
                    Responsive.w(context, 25),
                  ),

                  border: Border.all(color: theme.dividerColor),
                ),

                child: Text(
                  donor['status'] ?? 'Unknown',
                  textAlign: TextAlign.center,

                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isAvailable ? AppColors.success : Colors.orange,
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(context, 20)),

              // 5. DONOR INFORMATION CARDS
              Row(
                children: [
                  infoCard(context, group, 'Blood Group', isDark),

                  SizedBox(width: Responsive.w(context, 7)),

                  infoCard(context, '$distance km', 'Distance', isDark),

                  SizedBox(width: Responsive.w(context, 7)),

                  infoCard(context, donations, 'Donations', isDark),
                ],
              ),

              SizedBox(height: Responsive.h(context, 40)),

              // 6. SEND DONATION REQUEST
              SizedBox(
                width: double.infinity,
                height: Responsive.h(context, 45),

                child: ElevatedButton(
                  onPressed: () {
                    controller.sendDonationRequest(name);
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
                    'Send Donation Request',

                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: Responsive.h(context, 12)),

              // 7. CHAT AND LOCATION BUTTONS
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Responsive.h(context, 43),

                      child: OutlinedButton(
                        onPressed: () {
                          controller.openChat(name);
                          Get.to(() => ChatScreen());
                        },

                        style: OutlinedButton.styleFrom(
                          foregroundColor: theme.colorScheme.onSurface,

                          side: BorderSide(color: theme.colorScheme.onSurface),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 10),
                            ),
                          ),
                        ),

                        child: Text(
                          'Chat',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: Responsive.w(context, 5)),

                  Expanded(
                    child: SizedBox(
                      height: Responsive.h(context, 43),

                      child: OutlinedButton(
                        onPressed: () {
                          controller.viewLocation();
                          Get.to(() => RequestTrackingScreen());
                        },

                        style: OutlinedButton.styleFrom(
                          foregroundColor: theme.colorScheme.onSurface,

                          side: BorderSide(color: theme.colorScheme.onSurface),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 10),
                            ),
                          ),
                        ),

                        child: Text(
                          'View Location',
                          maxLines: 1,

                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: Responsive.sp(context, 13),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: Responsive.h(context, 15)),
            ],
          ),
        ),
      ),
    );
  }

  // REUSABLE INFORMATION CARD
  Widget infoCard(
    BuildContext context,
    String value,
    String label,
    bool isDark,
  ) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        height: Responsive.h(context, 66),

        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF47252E) : const Color(0xFFFFE8EC),

          borderRadius: BorderRadius.circular(Responsive.w(context, 12)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,

              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: Responsive.sp(context, 21),
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: Responsive.h(context, 3)),

            Text(
              label,

              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: Responsive.sp(context, 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
