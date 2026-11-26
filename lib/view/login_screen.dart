import 'package:bloodlink/core/responsive.dart';
import 'package:bloodlink/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_tabs.dart';

import '../controllers/login_controller.dart';
import '../widgets/theme_toggle.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.w(context, 22),
                  vertical: Responsive.h(context, 40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 1. BloodLink drop logo
                    Image.asset(
                      'assets/auth/drop.png',
                      height: Responsive.h(context, 58),
                      width: Responsive.w(context, 48),
                    ),
                    SizedBox(height: Responsive.h(context, 8)),

                    // 2. BloodLink Heading
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Blood",
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: "Link",
                            style: TextStyle(color: theme.colorScheme.primary),
                          ),
                        ],
                      ),

                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.sp(context, 24),
                      ),
                    ),
                    SizedBox(height: Responsive.h(context, 4)),
                    // 3. Tagline
                    Text(
                      'Connecting Donors, Saving Lives.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),

                    SizedBox(height: Responsive.h(context, 30)),

                    AuthTabs(
                      isSignUp: false,

                      onLogin: () {},

                      onSignUp: () {
                        Get.off(() => SignupScreen());
                      },
                    ),

                    SizedBox(height: Responsive.h(context, 30)),

                    TextField(
                      controller: controller.emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,

                      style: theme.textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: 'Email or Phone Number',
                        hintStyle: theme.textTheme.bodyMedium,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: Responsive.sp(context, 20),
                          color: theme.colorScheme.onSurface,
                        ),
                        filled: true,
                        fillColor: theme.colorScheme.surface,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: Responsive.h(context, 14),
                          horizontal: Responsive.w(context, 12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Responsive.w(context, 10),
                          ),

                          borderSide: BorderSide(
                            color: theme.dividerColor,
                            width: Responsive.w(context, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Responsive.w(context, 10),
                          ),

                          borderSide: BorderSide(
                            color: theme.colorScheme.primary,
                            width: Responsive.w(context, 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Responsive.h(context, 14)),

                    Obx(
                      () => TextField(
                        controller: controller.passController,
                        obscureText: controller.isPasswordHidden.value,
                        keyboardType: TextInputType.visiblePassword,
                        style: theme.textTheme.bodyMedium,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordVisibility,
                            icon: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: Responsive.w(context, 20),
                            color: theme.colorScheme.onSurface,
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surface,
                          hintText: "Password",
                          hintStyle: theme.textTheme.bodyMedium,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 10),
                            ),

                            borderSide: BorderSide(
                              color: theme.dividerColor,
                              width: Responsive.w(context, 1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 10),
                            ),

                            borderSide: BorderSide(
                              color: theme.colorScheme.primary,
                              width: Responsive.w(context, 1.5),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 14)),
                    Obx(() {
                      return Row(
                        children: [
                          SizedBox(
                            height: Responsive.h(context, 24),
                            width: Responsive.w(context, 24),
                            child: Checkbox(
                              value: controller.remember.value,
                              onChanged: controller.toggleRememberMe,
                              activeColor: theme.colorScheme.primary,
                              side: BorderSide(color: theme.dividerColor),
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          SizedBox(width: Responsive.w(context, 6)),
                          Text("Remember me", style: theme.textTheme.bodySmall),

                          const Spacer(),

                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forgot Password?',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),

                    SizedBox(height: Responsive.h(context, 32)),

                    SizedBox(
                      width: double.infinity,
                      height: Responsive.h(context, 44),

                      child: ElevatedButton(
                        onPressed: controller.login,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 10),
                            ),
                          ),
                        ),

                        child: Text(
                          'Login',

                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 28)),

                    Text(
                      'Or continue with',

                      textAlign: TextAlign.center,

                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: Responsive.h(context, 28)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google button
                        Expanded(
                          child: SizedBox(
                            height: Responsive.h(context, 42),

                            child: OutlinedButton(
                              onPressed: () {
                                Get.snackbar(
                                  'Google',
                                  'Google Sign-In will be added later.',
                                );
                              },

                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: theme.dividerColor),

                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.w(context, 8),
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    Responsive.w(context, 17),
                                  ),
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Image.asset(
                                    'assets/auth/google.png',
                                    width: Responsive.w(context, 30),
                                    height: Responsive.h(context, 30),
                                    fit: BoxFit.contain,
                                  ),

                                  SizedBox(width: Responsive.w(context, 6)),

                                  Flexible(
                                    child: Text(
                                      'Google',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: Responsive.w(context, 5)),

                        // Apple button
                        Expanded(
                          child: SizedBox(
                            height: Responsive.h(context, 42),

                            child: OutlinedButton(
                              onPressed: () {
                                Get.snackbar(
                                  'Apple',
                                  'Apple Sign-In will be added later.',
                                );
                              },

                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: theme.dividerColor),

                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsive.w(context, 8),
                                ),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    Responsive.w(context, 17),
                                  ),
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Image.asset(
                                    'assets/auth/apple.png',
                                    width: Responsive.w(context, 30),
                                    height: Responsive.h(context, 30),
                                    fit: BoxFit.contain,
                                    color: isDark ? Colors.white : null,
                                  ),

                                  SizedBox(width: Responsive.w(context, 6)),

                                  Flexible(
                                    child: Text(
                                      'Apple',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: Responsive.h(context, 8),
              right: Responsive.w(context, 16),
              child: const ThemeToggle(),
            ),
          ],
        ),
      ),
    );
  }
}
