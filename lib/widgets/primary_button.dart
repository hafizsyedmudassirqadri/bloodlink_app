import 'package:flutter/material.dart';

import '../app/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height * 0.2)),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: height * 0.3, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
