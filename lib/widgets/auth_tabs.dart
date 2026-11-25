
import 'package:flutter/material.dart';


import '../constants/app_colors.dart';
import '../core/responsive.dart';

class AuthTabs extends StatelessWidget {
  final bool isSignUp;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;

  const AuthTabs({
    super.key,
    required this.isSignUp,
    required this.onLogin,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onLogin,
            child: Container(
              height: Responsive.h(context, 36),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: !isSignUp
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  Responsive.w(context, 14),
                ),
                border: Border.all(
                  color: !isSignUp
                      ? AppColors.primary
                      : theme.dividerColor,
                ),
              ),
              child: Text(
                'Login',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: !isSignUp
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: Responsive.w(context, 4)),

        Expanded(
          child: GestureDetector(
            onTap: onSignUp,
            child: Container(
              height: Responsive.h(context, 36),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSignUp
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  Responsive.w(context, 14),
                ),
                border: Border.all(
                  color: isSignUp
                      ? AppColors.primary
                      : theme.dividerColor,
                ),
              ),
              child: Text(
                'Sign Up',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSignUp
                      ? Colors.white
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
