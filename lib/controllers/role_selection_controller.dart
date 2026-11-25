import 'package:get/get.dart';

class RoleSelectionController extends GetxController {
  // 0 = Donate Blood
  // 1 = Request Blood
  // 2 = Both (Recommended)

  RxInt selectedRole = 2.obs;
  void selectRole(int role) {
    selectedRole.value = role;
  }

  void continueNext() {
    Get.snackbar(
      "Role Selected",
      selectedRole.value == 0
          ? "Donate Blood"
          : selectedRole.value == 1
          ? 'Request Blood'
          : "Both",
    );
  }
}
