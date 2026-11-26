import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

import '../core/responsive.dart';
import '../constants/app_colors.dart';

class DonationCycleScreen extends StatelessWidget {
  const DonationCycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double baseAngle = -math.pi * 0.12;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive.w(context, 24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Responsive.w(context, 48),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: theme.colorScheme.onSurface,
                        size: Responsive.sp(context, 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Donation Cycle",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: Responsive.sp(context, 22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: Responsive.w(context, 48)),
                ],
              ),
              SizedBox(height: Responsive.h(context, 32)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: Responsive.w(context, 250),
                          height: Responsive.w(context, 250),
                          child: Stack(
                            fit: StackFit.expand,

                            children: [
                              CircularProgressIndicator(
                                value: 0.38,
                                backgroundColor: theme.colorScheme.onSurface
                                    .withValues(alpha: 0.12),
                                strokeWidth: Responsive.w(context, 20),
                                color: AppColors.success,
                              ),

                              // // Top
                              // Transform.rotate(
                              //   angle: baseAngle,
                              //   child: CircularProgressIndicator(
                              //     value: 0.12,
                              //     strokeWidth: Responsive.w(context, 20),
                              //     strokeCap: StrokeCap.round,
                              //     color: AppColors.success,
                              //     backgroundColor: Colors.transparent,
                              //   ),
                              // ),

                              // // Right
                              // Transform.rotate(
                              //   angle: baseAngle + math.pi / 2,
                              //   child: CircularProgressIndicator(
                              //     value: 0.12,
                              //     strokeWidth: Responsive.w(context, 20),
                              //     strokeCap: StrokeCap.round,
                              //     color: AppColors.success,
                              //     backgroundColor: Colors.transparent,
                              //   ),
                              // ),

                              // // Bottom
                              // Transform.rotate(
                              //   angle: baseAngle + math.pi,
                              //   child: CircularProgressIndicator(
                              //     value: 0.12,
                              //     strokeWidth: Responsive.w(context, 20),
                              //     strokeCap: StrokeCap.round,
                              //     color: AppColors.success,
                              //     backgroundColor: Colors.transparent,
                              //   ),
                              // ),

                              // // Left
                              // Transform.rotate(
                              //   angle: baseAngle + 3 * math.pi / 2,
                              //   child: CircularProgressIndicator(
                              //     value: 0.12,
                              //     strokeWidth: Responsive.w(context, 20),
                              //     strokeCap: StrokeCap.round,
                              //     color: AppColors.success,
                              //     backgroundColor: Colors.transparent,
                              //   ),
                              // ),
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/auth/drop.png',
                                      width: Responsive.w(context, 38),
                                      height: Responsive.w(context, 42),
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height: Responsive.h(context, 12)),
                                    Text(
                                      '68 Days\nRemaining',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.headlineMedium
                                          ?.copyWith(
                                            fontSize: Responsive.sp(
                                              context,
                                              26,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            height: 1.15,
                                          ),
                                    ),
                                    SizedBox(height: Responsive.h(context, 14)),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: Responsive.h(context, 7),
                                        horizontal: Responsive.w(context, 28),
                                      ),
                                      decoration: BoxDecoration(
                                        color: theme.scaffoldBackgroundColor,
                                        border: Border.all(
                                          color: theme.colorScheme.onSurface
                                              .withValues(alpha: 0.12),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          Responsive.w(context, 18),
                                        ),
                                      ),
                                      child: Text(
                                        '75%',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: Responsive.h(context, 32)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Next Eligible Date',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: Responsive.sp(context, 20),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: Responsive.h(context, 8)),
                          Text(
                            '15 Feb 2027',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: AppColors.primary,
                              fontSize: Responsive.sp(context, 26),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Responsive.h(context, 32)),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Responsive.h(context, 16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: theme.colorScheme.onSurface,
                                  size: Responsive.sp(context, 22),
                                ),
                                SizedBox(width: Responsive.w(context, 16)),

                                Expanded(
                                  child: Text(
                                    "Last Donation",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: Responsive.sp(context, 16),
                                    ),
                                  ),
                                ),

                                Text(
                                  "17 Nov 2026",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: Responsive.sp(context, 14),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            height: 1,
                            thickness: 1,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Responsive.h(context, 16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: theme.colorScheme.onSurface,
                                  size: Responsive.sp(context, 22),
                                ),
                                SizedBox(width: Responsive.w(context, 16)),

                                Expanded(
                                  child: Text(
                                    "Cool-Off Period",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: Responsive.sp(context, 16),
                                    ),
                                  ),
                                ),

                                Text(
                                  "90 Days",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: Responsive.sp(context, 14),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            height: 1,
                            thickness: 1,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Responsive.h(context, 16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: theme.colorScheme.onSurface,
                                  size: Responsive.sp(context, 22),
                                ),
                                SizedBox(width: Responsive.w(context, 16)),

                                Expanded(
                                  child: Text(
                                    "Cycle Progress",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: Responsive.sp(context, 16),
                                    ),
                                  ),
                                ),

                                Text(
                                  "68 / 90 Days (75%)",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: Responsive.sp(context, 14),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            height: 1,
                            thickness: 1,
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
