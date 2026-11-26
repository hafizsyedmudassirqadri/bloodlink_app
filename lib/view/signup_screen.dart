import 'package:bloodlink/view/role_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/responsive.dart';
import '../controllers/signup_controller.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/auth_tabs.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: Stack(
          children: [
            // Main signup form
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.w(context, 22),
                  vertical: Responsive.h(context, 40),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 1. Logo
                    Image.asset(
                      'assets/auth/drop.png',
                      width: Responsive.w(context, 48),
                      height: Responsive.h(context, 58),
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: Responsive.h(context, 8)),

                    // 2. Heading
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: Responsive.sp(context, 24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 4)),

                    // 3. Tagline
                    Text(
                      'Join BloodLink and be a part of a life-saving community.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),

                    SizedBox(height: Responsive.h(context, 30)),

                    // 4. Reusable Login / Sign Up tabs
                    AuthTabs(
                      isSignUp: true,

                      onLogin: () {
                        Get.off(() => LoginScreen());
                      },

                      onSignUp: () {},
                    ),

                    SizedBox(height: Responsive.h(context, 30)),

                    // 5. Full Name
                    TextField(
                      controller: controller.nameController,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      style: theme.textTheme.bodyMedium,

                      decoration: inputDecoration(
                        context,
                        'Full Name',
                        Icons.person_outline,
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 14)),

                    // 6. Email
                    TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: theme.textTheme.bodyMedium,

                      decoration: inputDecoration(
                        context,
                        'Email',
                        Icons.email_outlined,
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 14)),

                    // 7. Password
                    Obx(
                      () => TextField(
                        controller: controller.passwordController,
                        obscureText: controller.isPasswordHidden.value,
                        textInputAction: TextInputAction.next,
                        style: theme.textTheme.bodyMedium,

                        decoration:
                            inputDecoration(
                              context,
                              'Password',
                              Icons.lock_outline,
                            ).copyWith(
                              suffixIcon: IconButton(
                                onPressed: controller.togglePassword,

                                icon: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,

                                  size: Responsive.sp(context, 20),
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 14)),

                    // 8. Confirm Password
                    Obx(
                      () => TextField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.isConfirmPasswordHidden.value,
                        textInputAction: TextInputAction.done,
                        style: theme.textTheme.bodyMedium,

                        decoration:
                            inputDecoration(
                              context,
                              'Confirm Password',
                              Icons.lock_outline,
                            ).copyWith(
                              suffixIcon: IconButton(
                                onPressed: controller.toggleConfirmPassword,

                                icon: Icon(
                                  controller.isConfirmPasswordHidden.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,

                                  size: Responsive.sp(context, 20),
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 14)),

                    // 9. Remember Me + Forgot Password
                    Row(
                      children: [
                        Obx(
                          () => SizedBox(
                            width: Responsive.w(context, 24),
                            height: Responsive.w(context, 24),

                            child: Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: controller.toggleRememberMe,
                              activeColor: theme.colorScheme.primary,
                              visualDensity: VisualDensity.compact,
                              side: BorderSide(color: theme.dividerColor),
                            ),
                          ),
                        ),

                        SizedBox(width: Responsive.w(context, 6)),

                        Text('Remember me', style: theme.textTheme.bodySmall),

                        const Spacer(),

                        TextButton(
                          onPressed: () {
                            // Forgot Password navigation later
                          },

                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          child: Text(
                            'Forgot Password?',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: Responsive.h(context, 32)),

                    // 10. Create Account button
                    SizedBox(
                      width: double.infinity,
                      height: Responsive.h(context, 44),

                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => RoleSelectionScreen());
                          controller.signup();
                        },

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
                          'Create an account',

                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 23)),

                    // 11. Social login heading
                    Text(
                      'Or continue with',
                      textAlign: TextAlign.center,

                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),

                    SizedBox(height: Responsive.h(context, 20)),

                    // 12. Google and Apple buttons
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

                    SizedBox(height: Responsive.h(context, 20)),
                  ],
                ),
              ),
            ),

            // 13. Reusable theme toggle
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

  // Reusable input styling
  InputDecoration inputDecoration(
    BuildContext context,
    String hint,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return InputDecoration(
      hintText: hint,
      hintStyle: theme.textTheme.bodyMedium,

      prefixIcon: Icon(
        icon,
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
        borderRadius: BorderRadius.circular(Responsive.w(context, 10)),

        borderSide: BorderSide(
          color: theme.dividerColor,
          width: Responsive.w(context, 1),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Responsive.w(context, 10)),

        borderSide: BorderSide(
          color: theme.colorScheme.primary,
          width: Responsive.w(context, 1.5),
        ),
      ),
    );
  }
}
