import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context, double value,
    {bool isHeight = true}) {
  final size = MediaQuery.of(context).size;
  final designHeight = 844.0;
  final designWidth = 390.0;

  return isHeight
      ? (value / designHeight) * size.height
      : (value / designWidth) * size.width;
}
