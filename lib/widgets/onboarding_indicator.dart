import 'package:flutter/material.dart';

import '../app/constants/app_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.count,
    required this.index,
    required this.dotSize,
  });

  final int count;
  final int index;
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: dotSize * 0.45),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == index ? AppColors.primary : AppColors.indicatorInactive,
          ),
        );
      }),
    );
  }
}
