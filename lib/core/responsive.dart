
import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  // Responsive width
  static double w(BuildContext context, double value) {
    return width(context) * value / 390;
  }

  // Responsive height
  static double h(BuildContext context, double value) {
    return height(context) * value / 740;
  }

  // Responsive font size
  static double sp(BuildContext context, double value) {
    double scale = width(context) / 390;

    // Prevent extreme font scaling
    scale = scale.clamp(0.85, 1.15);

    return value * scale;
  }
}
