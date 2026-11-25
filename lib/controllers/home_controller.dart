import 'package:bloodlink/controllers/navigation_controller.dart';
import 'package:bloodlink/view/settings_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // figma Temporary Data
  final String userName = "Ali Khan";
  final int donations = 3;
  final int livesHelped = 9;

  // Open another bottom navigation tab
  void changeTab(int index) {
    Get.find<NavigationController>().changeTab(index);
  }

   // Open settings screen
  void openSettings() {
    Get.to(() => const SettingsScreen());
  }

  // Temporary notification action
  void openNotifications() {
    Get.snackbar('Notifications', 'Notifications screen will be added later.');
  }

  // Temporary action for future screens
  void comingSoon(String title) {
    Get.snackbar(title, 'This feature will be added later.');
  }
}
