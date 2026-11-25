import 'package:bloodlink/view/onboarding_screen.dart';
import 'package:get/get.dart';



class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToOnboarding();
  }

  Future<void> navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 4));

    if (isClosed) return;

    Get.off(() =>  OnboardingScreen());
  }
}
