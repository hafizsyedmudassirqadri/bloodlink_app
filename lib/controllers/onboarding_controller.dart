import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/constants/app_assets.dart';
import '../app/constants/app_strings.dart';
import '../app/routes/app_routes.dart';
import '../services/storage_service.dart';

class OnboardingItem {
  const OnboardingItem(this.title, this.description, this.image);
  final String title;
  final String description;
  final String image;
}

class OnboardingController extends GetxController {
  static const items = <OnboardingItem>[
    OnboardingItem('Donate Blood,\nSave Lives',
        'Your donation can give someone a second chance at life.',
        AppAssets.onboardingDonate),
    OnboardingItem('Find Nearby\nDonors',
        'Search, connect and help verified donors in your area.',
        AppAssets.onboardingDonors),
    OnboardingItem('Request Blood\nin Emergency',
        'Create an emergency request and get help from verified donors.',
        AppAssets.onboardingEmergency),
  ];

  final _storage = Get.find<StorageService>();
  final pageController = PageController();
  final currentIndex = 0.obs;
  bool _finishing = false;

  bool get isLast => currentIndex.value == items.length - 1;
  String get buttonLabel => isLast ? AppStrings.getStarted : AppStrings.next;

  void onPageChanged(int index) => currentIndex.value = index;

  void next() {
    if (isLast) {
      finish();
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  /// Not shown in the reference design; used for system back / programmatic use.
  void previous() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Future<void> finish() async {
    if (_finishing) return;
    _finishing = true;
    await _storage.setOnboardingCompleted();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
