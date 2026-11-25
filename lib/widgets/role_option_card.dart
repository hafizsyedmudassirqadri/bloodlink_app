import 'package:bloodlink/constants/app_colors.dart';
import 'package:bloodlink/core/responsive.dart';
import 'package:flutter/material.dart';

class RoleOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  const RoleOptionCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(context, 14),
          vertical: Responsive.h(context, 12),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF47252E) : const Color(0xFFFFE8EC))
              : theme.colorScheme.surface,

          borderRadius: BorderRadius.circular(Responsive.w(context, 12)),
          border: Border.all(
            color: isSelected ? AppColors.primary : theme.dividerColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // 1. Role icon
            Image.asset(
              imagePath,
              width: Responsive.w(context, 34),
              height: Responsive.w(context, 34),
              fit: BoxFit.contain,
            ),

            SizedBox(width: Responsive.w(context, 14)),

            // 2. Title and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: Responsive.h(context, 5)),

                  Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: Responsive.w(context, 8)),

            // 3. Selected / unselected indicator
            Container(
              width: Responsive.w(context, 18),
              height: Responsive.w(context, 18),

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: isSelected ? AppColors.primary : Colors.transparent,

                border: Border.all(
                  color: isSelected ? AppColors.primary : theme.dividerColor,
                ),
              ),

              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: Responsive.sp(context, 13),
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
