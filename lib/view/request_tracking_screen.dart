import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/responsive.dart';
import '../constants/app_colors.dart';

class RequestTrackingScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 24),
            vertical: Responsive.h(context, 20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(width: Responsive.w(context, 48)),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: theme.colorScheme.onSurface,
                      size: Responsive.sp(context, 24),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Request Tracking",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: Responsive.w(context, 48)),
                ],
              ),
              SizedBox(height: Responsive.h(context, 48)),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: Responsive.w(context, 36),
                                width: Responsive.w(context, 36),
                                decoration: BoxDecoration(
                                  color: AppColors.success,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: Responsive.sp(context, 22),
                                ),
                              ),

                              Container(
                                width: Responsive.w(context, 3),
                                height: Responsive.h(context, 70),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(width: Responsive.w(context, 20)),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Request Created',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontSize: Responsive.sp(context, 20),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(height: Responsive.h(context, 6)),
                                Text(
                                  '17 Nov, 08:20 PM',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: Responsive.w(context, 36),
                                width: Responsive.w(context, 36),
                                decoration: BoxDecoration(
                                  color: AppColors.success,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: Responsive.sp(context, 22),
                                ),
                              ),

                              Container(
                                width: Responsive.w(context, 3),
                                height: Responsive.h(context, 70),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(width: Responsive.w(context, 20)),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Donor Accepted',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontSize: Responsive.sp(context, 20),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(height: Responsive.h(context, 6)),
                                Text(
                                  'Hassan Raza · 08:45 PM',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: Responsive.w(context, 36),
                                width: Responsive.w(context, 36),
                                decoration: BoxDecoration(
                                  color: theme.scaffoldBackgroundColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primary,
                                    width: 1.7,
                                  ),
                                ),
                              ),

                              Container(
                                width: Responsive.w(context, 3),
                                height: Responsive.h(context, 70),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(width: Responsive.w(context, 20)),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'In Progress',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        color: AppColors.primary,
                                        fontSize: Responsive.sp(context, 20),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(height: Responsive.h(context, 6)),
                                Text(
                                  'Donation scheduled at \nMayo Hospital · 09:30 PM',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: Responsive.w(context, 36),
                                width: Responsive.w(context, 36),
                                decoration: BoxDecoration(
                                  color: AppColors.success,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: Responsive.sp(context, 22),
                                ),
                              ),

                              Container(
                                width: Responsive.w(context, 3),
                                height: Responsive.h(context, 70),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(width: Responsive.w(context, 20)),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Completed',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        fontSize: Responsive.sp(context, 20),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(height: Responsive.h(context, 6)),
                                Text(
                                  'Mark as completed once \nyour need is fulfilled.',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ],
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
