import 'package:get/get.dart';

class DonorDetailsController extends GetxController {
  void sendDonationRequest(String name) {
    Get.snackbar(
      'Coming Soon',
      'Donation request for $name will be added later.',
    );
  }

  void openChat(String name) {
    Get.snackbar('Chat', 'Chat with $name will be added later.');
  }

  void viewLocation() {
    Get.snackbar('Location', 'Map integration will be added later.');
  }
}
