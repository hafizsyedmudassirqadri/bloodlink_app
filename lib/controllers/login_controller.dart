import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // false = Login, true = Sign Up
  RxBool isSignUp = false.obs;

  void selectLogin() {
    isSignUp.value = false;
  }

  void selectSignUp() {
    isSignUp.value = true;
  }

  // Text Edoiting Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // Password Visibility Variable & Method
  RxBool isPasswordHidden = true.obs;
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  RxBool remember = false.obs;

  void toggleRememberMe(bool? value) {
    remember.value = value ?? false;
  }

  void login() {
    Get.snackbar('Login', 'Authentication will be added soon.');
  }

  void loginWithGoogle() {
    Get.snackbar('Google', 'Google Sign-In will be added soon.');
  }

  void loginWithApple() {
    Get.snackbar('Apple', 'Apple Sign-In will be added soon.');
  }

 
}
