// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'dart:convert';
// import 'dart:typed_data';

// class ProfileSetupController extends GetxController {
//   final ImagePicker picker = ImagePicker();
//   final RxnString selectedImagePath = RxnString();
//   final Rxn<Uint8List> selectedImageBytes = Rxn<Uint8List>();
//   static const String profileImageKey = 'profile_image';

//   Future<void> pickImage(ImageSource source) async {
//     try {
//       final XFile? image = await picker.pickImage(source: source);

//       if (image == null) {
//         return;
//       }
//       final Uint8List bytes = await image.readAsBytes();
//       final String encodedImage = base64Encode(bytes);
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString(profileImageKey, encodedImage);
//       selectedImageBytes.value = bytes;
//       selectedImagePath.value = image.path;
//     } catch (e) {
//       debugPrint('Image picker error: $e');
//     }
//   }

//   Future<void> loadSavedImage() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? savedImage = prefs.getString(profileImageKey);
//     if (savedImage == null) {
//       return;
//     }

//     selectedImageBytes.value = base64Decode(savedImage);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     loadSavedImage();
//   }
// }

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetupController extends GetxController {
  final ImagePicker picker = ImagePicker();

  final RxnString selectedImagePath = RxnString();
  final Rxn<Uint8List> selectedImageBytes = Rxn<Uint8List>();

  static const String profileImageKey = 'profile_image';

  // Select image and save it
  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await picker.pickImage(source: source);

      if (image == null) {
        return;
      }

      // Step 1: Read image bytes
      final Uint8List bytes = await image.readAsBytes();

      // Step 2: Convert bytes into JSON String
      final String encodedImage = jsonEncode(bytes.toList());

      // Step 3: Get SharedPreferences instance
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Step 4: Save JSON String
      await prefs.setString(profileImageKey, encodedImage);

      // Step 5: Update GetX variables
      selectedImageBytes.value = bytes;
      selectedImagePath.value = image.path;
    } catch (e) {
      debugPrint('Image picker error: $e');
    }
  }

  // Retrieve saved image
  Future<void> loadSavedImage() async {
    try {
      // Step 1: Get SharedPreferences instance
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Step 2: Retrieve JSON String
      final String? savedImage = prefs.getString(profileImageKey);

      if (savedImage == null) {
        return;
      }

      // Step 3: Decode JSON into List<int>
      final List<int> imageList = List<int>.from(jsonDecode(savedImage));

      // Step 4: Convert List<int> into Uint8List
      selectedImageBytes.value = Uint8List.fromList(imageList);
    } catch (e) {
      debugPrint('Load saved image error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadSavedImage();
  }
}
