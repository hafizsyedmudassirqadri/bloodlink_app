
import 'package:get/get.dart';

class NavigationController extends GetxController {

  // Current bottom navigation tab
  RxInt currentIndex = 0.obs;

  // Currently opened donor
  Rxn<Map<String, String>> selectedDonor =
      Rxn<Map<String, String>>();

  // Change bottom navigation tab
  void changeTab(int index) {
    currentIndex.value = index;
    selectedDonor.value = null;
  }

  // Open details of selected donor
  void openDonorDetails(Map<String, String> donor) {
    selectedDonor.value = donor;
    currentIndex.value = 1;
  }

  // Return to Find Donors list
  void backToDonors() {
    selectedDonor.value = null;
    currentIndex.value = 1;
  }
}
