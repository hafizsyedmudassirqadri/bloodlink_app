import 'package:bloodlink/constants/app_colors.dart';
import 'package:bloodlink/controllers/home_controller.dart';
import 'package:bloodlink/core/responsive.dart';
import 'package:bloodlink/view/donation_cycle_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  new({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 22),
            vertical: Responsive.h(context, 20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  CircleAvatar(
                    radius: Responsive.w(context, 24),
                    backgroundImage: AssetImage(
                      "assets/profile setup/avatar ali.png",
                    ),
                  ),
                  SizedBox(width: Responsive.w(context, 12)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning,', style: theme.textTheme.bodyMedium),

                      Text(
                        controller.userName,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontSize: Responsive.sp(context, 23),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                  //Notification Icon
                  Stack(
                    children: [
                      IconButton(
                        onPressed: controller.openNotifications,
                        icon: Icon(
                          Icons.notifications_none_outlined,
                          size: Responsive.sp(context, 27),
                          color: theme.colorScheme.onSurface,
                        ),
                      ),

                      Positioned(
                        top: 5,
                        right: 6,
                        child: Container(
                          width: Responsive.w(context, 9),
                          height: Responsive.w(context, 9),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Settings icon
                  IconButton(
                    onPressed: controller.openSettings,
                    icon: Icon(
                      Icons.settings_outlined,
                      size: Responsive.sp(context, 25),
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Responsive.h(context, 25)),
              // 2. EMERGENCY BANNER
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(Responsive.w(context, 16)),

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(
                    Responsive.w(context, 14),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emergency Need!',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontSize: Responsive.sp(context, 22),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: Responsive.h(context, 6)),

                          Text(
                            'O− Blood Required',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: Responsive.h(context, 4)),

                          Text(
                            'Mayo Hospital, Lahore\n2 min ago',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Image.asset(
                      'assets/home screen/siren.png',
                      width: Responsive.w(context, 72),
                      height: Responsive.h(context, 82),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Responsive.h(context, 18)),

              // 3. MAIN ACTION CARDS
              Row(
                children: [
                  mainActionCard(
                    context,
                    "Donate\nBlood",
                    "assets/home screen/drop.png",
                    () => controller.comingSoon('Donate Blood'),
                  ),
                  SizedBox(width: Responsive.w(context, 10)),
                  mainActionCard(
                    context,
                    "Request\nBlood",
                    "assets/home screen/plus.png",
                    () => controller.comingSoon('Request Blood'),
                  ),
                  SizedBox(width: Responsive.w(context, 10)),
                  mainActionCard(
                    context,
                    'Find\nDonors',
                    'assets/home screen/pin.png',
                    () => controller.changeTab(1),
                    highlighted: true,
                  ),
                ],
              ),

              SizedBox(height: Responsive.h(context, 14)),
              // 4. QUICK ACTIONS

              Row(
                children: [
                  quickActionCard(
                    context,
                    'Nearby\nHospitals',
                    'assets/home screen/hospital.png',
                    () => controller.comingSoon('Nearby Hospitals'),
                  ),

                  SizedBox(width: Responsive.w(context, 8)),

                  quickActionCard(
                    context,
                    'My\nRequests',
                    'assets/home screen/calendar.png',
                    () => controller.changeTab(2),
                  ),

                  SizedBox(width: Responsive.w(context, 8)),

                  quickActionCard(
                    context,
                    'Donation\nCycle',
                    'assets/home screen/clock.png',
                    () {
                      Get.to(() => DonationCycleScreen());
                    },
                  ),

                  SizedBox(width: Responsive.w(context, 8)),

                  quickActionCard(
                    context,
                    'More',
                    'assets/home screen/grid.png',
                    () => controller.comingSoon('More'),
                  ),
                ],
              ),

              SizedBox(height: Responsive.h(context, 25)),

              // 5. YOUR IMPACT HEADING
              Text(
                'Your Impact',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.sp(context, 23),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(context, 12)),

              // 6. IMPACT CARDS
              Row(
                children: [
                  impactCard(
                    context,
                    controller.donations.toString(),
                    'Donations',
                  ),

                  SizedBox(width: Responsive.w(context, 12)),

                  impactCard(
                    context,
                    controller.livesHelped.toString(),
                    'Lives Helped',
                  ),
                ],
              ),

              SizedBox(height: Responsive.h(context, 20)),
            ],
          ),
        ),
      ),
    );
  }

  // Main Action Card

  Widget mainActionCard(
    BuildContext context,
    String title,
    String image,
    VoidCallback onTap, {
    bool highlighted = false,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: Responsive.h(context, 100),
          padding: EdgeInsets.all(Responsive.w(context, 6)),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF47252E) : const Color(0xFFFFE8EC),

            borderRadius: BorderRadius.circular(Responsive.w(context, 13)),
            border: highlighted
                ? Border.all(color: const Color(0xFF0A9FF4), width: 2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: Responsive.w(context, 36),
                height: Responsive.w(context, 36),
                fit: BoxFit.contain,
              ),
              SizedBox(height: Responsive.h(context, 8)),

              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: Responsive.sp(context, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // QUICK ACTION CARD
  Widget quickActionCard(
    BuildContext context,
    String title,
    String image,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: Responsive.h(context, 83),
          padding: EdgeInsets.symmetric(horizontal: Responsive.w(context, 3)),

          decoration: BoxDecoration(
            color: theme.colorScheme.surface,

            borderRadius: BorderRadius.circular(Responsive.w(context, 11)),

            border: Border.all(color: theme.dividerColor),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: Responsive.w(context, 25),
                height: Responsive.w(context, 25),
                fit: BoxFit.contain,
              ),

              SizedBox(height: Responsive.h(context, 10)),

              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: Responsive.sp(context, 11),
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // IMPACT CARD
  Widget impactCard(BuildContext context, String number, String title) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Expanded(
      child: Container(
        height: Responsive.h(context, 73),

        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF47252E) : const Color(0xFFFFE8EC),

          borderRadius: BorderRadius.circular(Responsive.w(context, 12)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontSize: Responsive.sp(context, 25),
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            Text(title, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
