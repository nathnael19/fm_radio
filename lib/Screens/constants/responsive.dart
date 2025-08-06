import 'dart:math' as math;

import 'package:flutter/material.dart';

double getMobileHeight(BuildContext context, double height) {
  double actualHeight = 844;
  double mobileHeight = MediaQuery.of(context).size.height;
  return (height / actualHeight) * mobileHeight;
}

double getMobileWidth(BuildContext context, double width) {
  double actualWidth = 390;
  double mobileWidth = MediaQuery.of(context).size.width;
  return (width / actualWidth) * mobileWidth;
}

double getMobileFontSize(BuildContext context, double fontSize) {
  double actualWidth = 911.4;
  double mobileWidth = MediaQuery.of(context).size.width;
  double mobileHeight = MediaQuery.of(context).size.height;
  double diagonal =
      math.sqrt(mobileHeight * mobileHeight + mobileWidth * mobileWidth);
  return (diagonal / actualWidth) * fontSize;
}
