import 'package:get/get.dart';

import '../app/routes/app_routes.dart';
import '../services/storage_service.dart';

class SplashController extends GetxController {
  static const _splashDelay = Duration(seconds: 2);
  final _storage = Get.find<StorageService>();
  bool _navigated = false;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(_splashDelay, _navigate);
  }

  void _navigate() {
    if (_navigated) return;
    _navigated = true;
    Get.offAllNamed(
      _storage.isOnboardingCompleted ? AppRoutes.login : AppRoutes.onboarding,
    );
  }
}
