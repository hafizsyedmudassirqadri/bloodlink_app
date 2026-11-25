
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Input controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // GetX reactive variables
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;
  RxBool rememberMe = false.obs;

  // Password visibility
  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Confirm password visibility
  void toggleConfirmPassword() {
    isConfirmPasswordHidden.value =
        !isConfirmPasswordHidden.value;
  }

  // Remember me
  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  // Temporary signup action
  void signup() {
    Get.snackbar(
      'Sign Up',
      'Registration will be added later.',
    );
  }

 
 
}
