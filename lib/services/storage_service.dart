import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _onboardingDoneKey = 'onboarding_completed';
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool get isOnboardingCompleted => _prefs.getBool(_onboardingDoneKey) ?? false;

  Future<void> setOnboardingCompleted() =>
      _prefs.setBool(_onboardingDoneKey, true);
}
