import 'package:flutter/material.dart';

class AppColor extends Color {
  AppColor(int value) : super(value);

  static const Color background = Color(0xFF4250a8);
  static const primaryColor = Color(0xFFFFFFFF);

  static const cardColor1 = Color(0xFFdd23ff);
  static const cardColor1_2 = Color(0xFF23cafe);

  static const cardColor2 = Colors.blueAccent;
  static const cardColor2_1 = Color(0xFF736ff7);
  
  static const cardColor3 = Color(0xFF23cafe);
  static const cardColor3_1 = Color(0xFFdd23ff);
  
  static const cardColor4 = Colors.purpleAccent;
  static const cardColor4_1 = Color(0xFF9348fb);
}

final List<LinearGradient> cardColors = [
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColor.cardColor1, AppColor.cardColor1_2],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColor.cardColor2, AppColor.cardColor2_1],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColor.cardColor3, AppColor.cardColor3_1],
  ),
  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColor.cardColor4, AppColor.cardColor4_1],
  ),
];
