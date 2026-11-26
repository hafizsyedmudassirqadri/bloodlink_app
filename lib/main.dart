import 'package:bloodlink/view/donation_cycle_screen.dart';
import 'package:bloodlink/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_theme.dart';
import 'controllers/theme_controller.dart';

void main() {
  Get.put(ThemeController(), permanent: true);
  runApp(const BloodLinkApp());
}

class BloodLinkApp extends StatelessWidget {
  const BloodLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.fromView(
      view: WidgetsBinding.instance.platformDispatcher.views.first,
      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BloodLink',
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            themeMode: ThemeMode.light,
            home: SplashScreen(),
            // home: DonationCycleScreen(),
          );
        },
      ),
    );
  }
}


