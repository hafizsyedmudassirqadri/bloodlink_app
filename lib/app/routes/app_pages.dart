import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';
import '../../controllers/splash_controller.dart';
import '../../views/onboarding/onboarding_view.dart';
import '../../views/splash/splash_view.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
      transition: Transition.fadeIn,
    ),
  ];
}
