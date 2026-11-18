import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_colors.dart';
import '../../controllers/onboarding_controller.dart';
import '../../widgets/onboarding_indicator.dart';
import '../../widgets/primary_button.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    final h = mq.size.height;
    final landscape = mq.orientation == Orientation.landscape;
    final shortSide = w < h ? w : h;

    final hPad = w * 0.06;
    final buttonW = landscape ? w * 0.5 : w * 0.88;
    final buttonH = (h * 0.065).clamp(44.0, 56.0);
    final dot = shortSide * 0.017;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) controller.previous();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(hPad, 0, hPad, 0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: OnboardingController.items.length,
                    itemBuilder: (_, i) => _Page(
                      item: OnboardingController.items[i],
                      landscape: landscape,
                      screenW: w,
                      screenH: h,
                      shortSide: shortSide,
                    ),
                  ),
                ),
                Obx(() => OnboardingIndicator(
                    count: OnboardingController.items.length,
                    index: controller.currentIndex.value,
                    dotSize: dot)),
                SizedBox(height: h * (landscape ? 0.03 : 0.07)),
                Obx(() => PrimaryButton(
                    label: controller.buttonLabel,
                    onPressed: controller.next,
                    width: buttonW,
                    height: buttonH)),
                SizedBox(height: h * (landscape ? 0.03 : 0.04)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    required this.item,
    required this.landscape,
    required this.screenW,
    required this.screenH,
    required this.shortSide,
  });

  final OnboardingItem item;
  final bool landscape;
  final double screenW;
  final double screenH;
  final double shortSide;

  @override
  Widget build(BuildContext context) {
    final titleSize = shortSide * 0.052;
    final descSize = shortSide * 0.034;

    final text = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: titleSize,
                height: 1.25,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark)),
        SizedBox(height: screenH * 0.015),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: landscape ? 0 : screenW * 0.12),
          child: Text(item.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: descSize, height: 1.45, color: AppColors.textBody)),
        ),
      ],
    );

    return LayoutBuilder(builder: (context, c) {
      if (landscape) {
        return Row(
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(c.maxHeight * 0.06),
                  child: Image.asset(item.image, fit: BoxFit.contain),
                )),
            Expanded(flex: 5, child: Center(child: text)),
          ],
        );
      }
      return Column(
        children: [
          SizedBox(height: c.maxHeight * 0.10),
          SizedBox(
              width: screenW * 0.8,
              height: c.maxHeight * 0.52,
              child: Image.asset(item.image, fit: BoxFit.contain)),
          SizedBox(height: c.maxHeight * 0.06),
          text,
        ],
      );
    });
  }
}
