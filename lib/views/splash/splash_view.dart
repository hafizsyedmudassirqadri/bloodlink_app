import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/constants/app_assets.dart';
import '../../app/constants/app_colors.dart';
import '../../app/constants/app_strings.dart';
import '../../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    final h = mq.size.height;
    final landscape = mq.orientation == Orientation.landscape;
    final shortSide = w < h ? w : h;

    final logoW = shortSide * (landscape ? 0.22 : 0.26);
    final titleSize = shortSide * 0.075;
    final tagSize = shortSide * 0.032;
    final waveH = h * (landscape ? 0.24 : 0.30);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: waveH,
            child: CustomPaint(painter: _WavePainter()),
          ),
          SafeArea(
            bottom: false,
            child: Align(
              alignment: const Alignment(0, -0.18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.splashLogo,
                      width: logoW, fit: BoxFit.contain),
                  SizedBox(height: h * 0.012),
                  Text.rich(
                    const TextSpan(children: [
                      TextSpan(
                          text: AppStrings.appNameBlood,
                          style: TextStyle(color: AppColors.textDark)),
                      TextSpan(
                          text: AppStrings.appNameLink,
                          style: TextStyle(color: AppColors.primary)),
                    ]),
                    style: TextStyle(
                        fontSize: titleSize, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: h * 0.008),
                  Text(AppStrings.tagline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: tagSize,
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final w = s.width, h = s.height;
    final rect = Rect.fromLTWH(0, 0, w, h);

    Path wave(double y0, double a1, double a2) => Path()
      ..moveTo(0, h * y0)
      ..cubicTo(w * 0.25, h * (y0 - a1), w * 0.5, h * (y0 + a2), w * 0.75,
          h * (y0 - a1 * 0.4))
      ..cubicTo(w * 0.88, h * (y0 - a1 * 0.8), w * 0.95, h * y0, w,
          h * (y0 - a1 * 0.3))
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();

    Paint grad(Color a, Color b) => Paint()
      ..shader = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [a, b])
          .createShader(rect);

    canvas.drawPath(wave(0.10, 0.12, 0.12),
        grad(AppColors.waveLight, const Color(0xFFF9C6CC)));
    canvas.drawPath(
        wave(0.32, 0.16, 0.14), grad(AppColors.waveMid, AppColors.primary));
    canvas.drawPath(
        wave(0.62, 0.14, 0.10), grad(AppColors.primary, AppColors.primaryDark));

    // ECG line with heart.
    final cy = h * 0.42;
    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.006
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(
        Path()
          ..moveTo(w * 0.16, cy)
          ..lineTo(w * 0.30, cy)
          ..lineTo(w * 0.34, cy - h * 0.10)
          ..lineTo(w * 0.38, cy + h * 0.10)
          ..lineTo(w * 0.42, cy)
          ..lineTo(w * 0.46, cy),
        stroke);
    canvas.drawPath(
        Path()
          ..moveTo(w * 0.54, cy)
          ..lineTo(w * 0.84, cy),
        stroke);

    final hr = w * 0.045, hx = w * 0.50, hy = cy - hr * 0.2;
    canvas.drawPath(
        Path()
          ..moveTo(hx, hy + hr * 1.5)
          ..cubicTo(hx - hr * 2.2, hy, hx - hr * 1.2, hy - hr * 1.8, hx,
              hy - hr * 0.6)
          ..cubicTo(hx + hr * 1.2, hy - hr * 1.8, hx + hr * 2.2, hy, hx,
              hy + hr * 1.5),
        stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
