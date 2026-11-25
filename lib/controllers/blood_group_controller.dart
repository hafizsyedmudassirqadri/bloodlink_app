import 'package:get/get.dart';

class BloodGroupController extends GetxController {
  // All blood groups
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  // Selected blood group
  RxString selectedGroup = 'A+'.obs;

  void selectGroup(String group) {
    selectedGroup.value = group;
  }

  // Continue button action
  void continueNext() {
    Get.snackbar('Blood Group Selected', selectedGroup.value);
  }
}
