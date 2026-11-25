import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../core/responsive.dart';
import '../constants/app_colors.dart';

class ThemeToggle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find<ThemeController>();
    return Obx(
      () => Container(
        padding: EdgeInsets.all(Responsive.w(context, 4)),
        decoration: BoxDecoration(
          color: controller.isDark.value
              ? AppColors.darkCard
              : Color(0xFFFFE4E7),

          borderRadius: BorderRadius.circular(Responsive.w(context, 30)),
        ),
        child: Row(
          children: [
            // light mode button
            _iconButton(
              context: context,
              icon: Icons.light_mode,
              selected: !controller.isDark.value,
              onPressed: () {
                if (controller.isDark.value) {
                  controller.toggleTheme();
                }
              },
            ),

            // dark mode button
             _iconButton(
              context: context,
              icon: Icons.dark_mode,
              selected: controller.isDark.value,
              onPressed: () {
                if (!controller.isDark.value) {
                  controller.toggleTheme();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _iconButton({
  required BuildContext context,
  required IconData icon,
  required bool selected,
  required VoidCallback onPressed,
}) {
  return Container(
    width: Responsive.w(context, 36),
    height: Responsive.h(context, 36),
    decoration: BoxDecoration(
      color: selected ? AppColors.primary : Colors.transparent,

      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        size: Responsive.sp(context, 19),
        color: selected ? Colors.white : AppColors.lightSubtext,
      ),
    ),
  );
}
