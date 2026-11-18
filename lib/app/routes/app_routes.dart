abstract class AppRoutes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';

  /// LOGIN INTEGRATION POINT (owned by the Login/Sign Up developer).
  /// Splash (onboarding already completed) and Onboarding ("Get Started")
  /// both navigate here. Register a GetPage with this name in AppPages.
  static const login = '/login';
}
