import 'package:bloodlink/core/responsive.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BloodLinkBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BloodLinkBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      // type: BottomNavigationBarType.fixed,
      backgroundColor: theme.colorScheme.surface,
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: theme.textTheme.bodySmall?.color,
      selectedFontSize: Responsive.sp(context, 11),
      unselectedFontSize: Responsive.sp(context, 10),
      iconSize: Responsive.w(context, 24),

      showSelectedLabels: true,

      showUnselectedLabels: true,

      elevation: 0,
      items: [
        // Home
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        // Find Donor
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: "Find Donors",
        ),
        // Requests
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Requests",
        ),
        // Activity
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Activity",
        ),
        // Profile
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
