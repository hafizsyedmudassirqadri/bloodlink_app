import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindDonorsController extends GetxController {
  // 1. Search TextField controller
  final TextEditingController searchController = TextEditingController();

  // 2. Search text
  RxString searchText = ''.obs;

  // 3. Blood group filter
  RxString selectedBloodGroup = 'All'.obs;

  // 4. Distance filter
  RxBool nearbyOnly = false.obs;

  // 5. Availability filter
  RxBool availableOnly = false.obs;

  // 6. Favorite donors
  RxList<String> favorites = <String>[].obs;

  // 7. Sample donor data

  final List<Map<String, String>> donors = [
    {
      'name': 'Hassan Raza',
      'group': 'A+',
      'km': '2.4',
      'city': 'Karachi',
      'status': 'Available',
      'image': 'assets/find donor/avatar-hassan.png',
      'portrait': 'assets/donor details/portrait-hassan.png',
      'donations': '12',
      'verified': 'true',
    },
    {
      'name': 'Ayesha Malik',
      'group': 'O+',
      'km': '3.1',
      'city': 'Karachi',
      'status': 'Available',
      'image': 'assets/find donor/avatar-ayesha.png',
      'portrait': 'assets/donor details/portrait-ayesha.png',
      'donations': '—',
      'verified': 'unknown',
    },
    {
      'name': 'Usman Ali',
      'group': 'B+',
      'km': '4.2',
      'city': 'Karachi',
      'status': 'Busy',
      'image': 'assets/find donor/avatar-usman.png',
      'portrait': 'assets/donor details/portrait-usman.png',
      'donations': '—',
      'verified': 'unknown',
    },
  ];

  // 8. Search and filters
  List<Map<String, String>> get visibleDonors {
    return donors.where((donor) {
      final search = searchText.value.toLowerCase().trim();

      final matchesSearch =
          donor['name']!.toLowerCase().contains(search) ||
          donor['group']!.toLowerCase().contains(search) ||
          donor['city']!.toLowerCase().contains(search);

      final matchesGroup =
          selectedBloodGroup.value == 'All' ||
          donor['group'] == selectedBloodGroup.value;

      final matchesDistance =
          !nearbyOnly.value || double.parse(donor['km']!) <= 3.0;

      final matchesAvailability =
          !availableOnly.value || donor['status'] == 'Available';

      return matchesSearch &&
          matchesGroup &&
          matchesDistance &&
          matchesAvailability;
    }).toList();
  }

  // 9. Distance filter toggle
  void toggleDistance() {
    nearbyOnly.value = !nearbyOnly.value;
  }

  // 10. Availability filter toggle
  void toggleAvailability() {
    availableOnly.value = !availableOnly.value;
  }

  // 11. Favorite toggle
  void toggleFavorite(String name) {
    if (favorites.contains(name)) {
      favorites.remove(name);
    } else {
      favorites.add(name);
    }
  }

  // 12. Reset all filters
  void resetFilters() {
    searchController.clear();
    searchText.value = '';
    selectedBloodGroup.value = 'All';
    nearbyOnly.value = false;
    availableOnly.value = false;
  }

  // 13. Dispose TextEditingController
  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
