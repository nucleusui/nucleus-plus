import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nucles_app/config/config.dart';

final themeNotifier = ValueNotifier<bool>(false);
SystemUiOverlayStyle get currentSystemUiOverlayStyle => SystemUiOverlayStyle(
      statusBarIconBrightness:
          themeNotifier.value ? Brightness.light : Brightness.dark,
      statusBarBrightness:
          themeNotifier.value ? Brightness.dark : Brightness.light,
    );

final theme = ThemeData(
  fontFamily: 'PlusJakartaSans',
  colorScheme: const ColorScheme.light(surface: Colors.white),
  bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
  textTheme: const TextTheme(
    displaySmall: AssetStyles.pSm,
    displayMedium: AssetStyles.pMd,
    displayLarge: AssetStyles.pLg,
    bodySmall: AssetStyles.pXs,
    bodyMedium: AssetStyles.pMd,
    bodyLarge: AssetStyles.pLg,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'PlusJakartaSans',
  colorScheme: ColorScheme.dark(
    surface: AppColors.getColor(ColorKey.background),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    surfaceTintColor: AppColors.getColor(ColorKey.background),
  ),
  textTheme: TextTheme(
    displaySmall: AssetStyles.pSm.copyWith(color: Colors.white),
    displayMedium: AssetStyles.pMd.copyWith(color: Colors.white),
    displayLarge: AssetStyles.pLg.copyWith(color: Colors.white),
    bodySmall: AssetStyles.pXs.copyWith(color: Colors.white),
    bodyMedium: AssetStyles.pMd.copyWith(color: Colors.white),
    bodyLarge: AssetStyles.pLg.copyWith(color: Colors.white),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
  ),
);

class MyScrollBehavior extends ScrollBehavior {
  const MyScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(context) => const ClampingScrollPhysics();

  @override
  Widget buildOverscrollIndicator(context, child, details) => child;
}
