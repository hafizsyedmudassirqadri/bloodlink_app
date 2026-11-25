import 'package:bloodlink/controllers/navigation_controller.dart';
import 'package:bloodlink/view/find_donors_screen.dart';
import 'package:bloodlink/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_screen.dart';
import 'donor_details_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  MainNavigationScreen({super.key});

  final NavigationController controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Temporary screens for testing
    final List<Widget> pages = [
      // Center(
      //   child: Text(
      //     'Home Screen',
      //     style: theme.textTheme.headlineMedium,
      //   ),
      // ),
      HomeScreen(),
      // Center(
      //   child: Text(
      //     'Find Donors Screen',
      //     style: theme.textTheme.headlineMedium,
      //   ),
      // ),
      FindDonorsScreen(),
      Center(
        child: Text('Requests Screen', style: theme.textTheme.headlineMedium),
      ),

      Center(
        child: Text('Activity Screen', style: theme.textTheme.headlineMedium),
      ),

      Center(
        child: Text('Profile Screen', style: theme.textTheme.headlineMedium),
      ),
    ];

    return Obx(
      () => Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,

        // Selected screen
        body:
            controller.currentIndex.value == 1 &&
                controller.selectedDonor.value != null
            ? DonorDetailsScreen(donor: controller.selectedDonor.value!)
            : pages[controller.currentIndex.value],

        // Bottom navigation
        bottomNavigationBar: BloodLinkBottomNavigationBar(
          currentIndex: controller.currentIndex.value,

          onTap: controller.changeTab,
        ),
      ),
    );
  }
}
