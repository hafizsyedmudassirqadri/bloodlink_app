
import 'package:bloodlink/view/login_screen.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {

  // Current onboarding page
  RxInt currentPage = 0.obs;

  // All onboarding images
  final List<String> images = [
    'assets/onboard/onboard-donation.png',
    'assets/onboard/onboard-discovery.png',
    'assets/onboard/onboard-hospital.png',
  ];

  // All headings
  final List<String> titles = [
    'Donate Blood,\nSave Lives',
    'Find Nearby\nDonors',
    'Request Blood\nWhen You Need',
  ];

  // All descriptions
  final List<String> descriptions = [
    'Your donation can give someone a second chance at life.',
    'Search, connect and help verified donors in your area.',
    'Create an emergency request and get help from verified donors.',
  ];

  // Next button logic
 
void nextPage() {
  if (currentPage.value < 2) {
    currentPage.value++;
  } else {
    Get.off(() =>  LoginScreen());
  }
}

}
