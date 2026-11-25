
import 'package:flutter/material.dart';

import '../core/responsive.dart';
import '../widgets/theme_toggle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text(
          'Settings',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: Responsive.sp(context, 21),
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 22),
            vertical: Responsive.h(context, 24),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Appearance',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: Responsive.sp(context, 20),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Responsive.h(context, 16)),

              Container(
                width: double.infinity,

                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.w(context, 12),
                  vertical: Responsive.h(context, 18),
                ),

                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,

                  borderRadius: BorderRadius.circular(
                    Responsive.w(context, 12),
                  ),

                  border: Border.all(
                    color: theme.dividerColor,
                  ),
                ),

                child: Row(
                  children: [
                    Icon(
                      isDark
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      color: theme.colorScheme.primary,
                    ),

                    SizedBox(width: Responsive.w(context, 10)),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'App Theme',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            isDark ? 'Dark Mode' : 'Light Mode',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),

                    // Existing reusable toggle
                    const ThemeToggle(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
