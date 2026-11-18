import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/initial_binding.dart';
import 'app/constants/app_colors.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await StorageService().init();
  runApp(BloodLinkApp(storage: storage));
}

class BloodLinkApp extends StatelessWidget {
  const BloodLinkApp({super.key, required this.storage});
  final StorageService storage;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BloodLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        // Reference uses Poppins. Add font files and register them in
        // pubspec.yaml; until then the default font is used.
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      initialBinding: InitialBinding(storage),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
