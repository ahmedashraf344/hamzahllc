import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamzahllc/constant/app_enums.dart';
import 'package:hamzahllc/constant/app_settings.dart';
import 'package:hamzahllc/resources/my_colors.dart';

class MyStyles {
  static TextStyle textStyle({
    double fontSize = 16.0,
    Color? color,
    double height = 1.2,
    TextDecoration? decoration,
    FontWeight fontWeight = FontWeight.w500,
    bool isOverFlow = false,
    String fontFamily = FontFamily.almarai,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color ?? MyColors.black,
      height: height,
      overflow: isOverFlow ? TextOverflow.ellipsis : TextOverflow.visible,
      decoration: decoration,
      fontFamily: fontFamily,
    );
  }

  static BorderRadius borderRadius({
    double radius = 5.0,
    BorderRadiusType type = BorderRadiusType.all,
  }) {
    switch (type) {
      case BorderRadiusType.all:
        return BorderRadius.circular(radius).r;
      case BorderRadiusType.top:
        return BorderRadius.vertical(top: Radius.circular(radius)).r;
      case BorderRadiusType.bottom:
        return BorderRadius.vertical(bottom: Radius.circular(radius)).r;
      case BorderRadiusType.left:
        return BorderRadius.horizontal(left: Radius.circular(radius)).r;
      case BorderRadiusType.right:
        return BorderRadius.horizontal(right: Radius.circular(radius)).r;
      case BorderRadiusType.reverse:
        return BorderRadius.only(
          bottomRight: Radius.circular(radius),
          topLeft: Radius.circular(radius),
        ).r;
    }
  }

  static BorderSide borderSide({
    Color? color,
    double width = 1.0,
  }) =>
      BorderSide(
        color: color ?? MyColors.black,
        width: width,
      );

  static BoxBorder borderAll({
    double width = 1.0,
    Color? color,
  }) =>
      Border.all(
        color: color ?? MyColors.black,
        width: width,
      );

  static InputBorder inputBorder({
    double radius = 5.0,
    Color? color,
    double width = 0.6,
  }) {
    return OutlineInputBorder(
      borderRadius: borderRadius(radius: radius),
      borderSide: borderSide(
        color: color ?? MyColors.black,
        width: width,
      ),
    );
  }
}
