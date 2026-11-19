import 'package:flutter/widgets.dart';

/// Read inside build to keep dimensions current when the screen size changes.
class AppMediaQuery {
  AppMediaQuery.of(BuildContext context) : _size = MediaQuery.sizeOf(context);

  final Size _size;

  double get height => _size.height;

  double get width => _size.width;
}
