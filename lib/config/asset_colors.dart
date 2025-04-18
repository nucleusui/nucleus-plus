import 'package:flutter/material.dart';
import 'package:nucles_app/app/app_theme.dart';

class AssetColors {
  static const Color green = Color(0XFF008557);
  static const Color blue = Color(0XFF308AFF);
  static const Color facebook = Color(0XFF0078FF);
  static const Color orange = Color(0XFFFF5226);
  static const Color red = Color(0XFFFF5247);
  static const Color yellow = Color(0XFFFFD84D);
  static const Color danger = Color(0XFFDB340B);
}

enum ColorKey {
  primary10,
  primary20,
  primary30,
  primary40,
  primary50,
  primary60,
  primary70,
  primary80,
  primary90,
  primary100,
  grey10,
  grey20,
  grey30,
  grey40,
  grey50,
  grey60,
  grey70,
  grey80,
  grey90,
  grey100,
  pastelBlue,
  background,
}

class AppColors {
  static Color getColor(ColorKey colorKey) {
    return themeNotifier.value
        ? DarkColors.getColor(enumToString(colorKey)) ??
            LightColors.getColor(enumToString(colorKey))
        : LightColors.getColor(enumToString(colorKey));
  }

  static String enumToString(Object enumValue) {
    return enumValue.toString().split('.').last;
  }
}

class LightColors {
  static const Map<String, Color> colors = {
    // primary colors
    'primary10': Color(0XFFF6F5FF),
    'primary20': Color(0XFFF0EDFF),
    'primary30': Color(0XFFDBD4FF),
    'primary40': Color(0XFFB4A6FF),
    'primary50': Color(0XFF907AFF),
    'primary60': Color(0XFF7257FF),
    'primary70': Color(0XFF5336E2),
    'primary80': Color(0XFF34228F),
    'primary90': Color(0XFF291F61),
    'primary100': Color(0XFF130D33),

    // neutral colors
    'grey10': Color(0XFFF4F6F7),
    'grey20': Color(0XFFE6E9EB),
    'grey30': Color(0XFFDADDDE),
    'grey40': Color(0XFFC1C4C6),
    'grey50': Color(0XFF898D8F),
    'grey60': Color(0XFF6E7375),
    'grey70': Color(0XFF53575A),
    'grey80': Color(0XFF2F3133),
    'grey90': Color(0XFF1F2224),
    'grey100': Color(0XFF131214),

    // other colors
    'pastelBlue': Color(0XFFAFBCCB),
    'background': Color(0XFFFFFFFF),
  };

  static Color getColor(String colorKey) {
    return colors[colorKey] ?? const Color(0XFF000000);
  }
}

class DarkColors {
  static const Map<String, Color> colors = {
    // primary colors
    'primary10': Color(0XFF130D33),
    'primary20': Color(0XFF291F61),
    'primary30': Color(0XFF34228F),
    'primary40': Color(0XFF5336E2),
    'primary50': Color(0XFF7257FF),
    'primary60': Color(0XFF907AFF),
    'primary70': Color(0XFFB4A6FF),
    'primary80': Color(0XFFDBD4FF),
    'primary90': Color(0XFFF0EDFF),
    'primary100': Color(0XFFF6F5FF),

    // neutral colors
    'grey10': Color(0XFF1F2224),
    'grey100': Color(0XFFF4F6F7),

    // other colors
    'background': Color(0XFF131214),
  };

  static Color? getColor(String colorKey) {
    return colors[colorKey];
  }
}
