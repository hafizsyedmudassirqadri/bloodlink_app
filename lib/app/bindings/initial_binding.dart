import 'package:get/get.dart';

import '../../services/storage_service.dart';

class InitialBinding extends Bindings {
  InitialBinding(this.storage);
  final StorageService storage;

  @override
  void dependencies() {
    Get.put<StorageService>(storage, permanent: true);
  }
}
