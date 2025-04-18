import 'package:flutter/material.dart';

extension Context on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);
  EdgeInsets get paddingOf => MediaQuery.paddingOf(this);
  EdgeInsets get viewPaddingOf => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsetsOf => MediaQuery.viewInsetsOf(this);

  // Get the screen size and padding
  double get screenWidth => sizeOf.width;
  double get screenHeight => sizeOf.height;
  double get padTop => paddingOf.top;
  double get padBottom => paddingOf.bottom;

  // Extra padding for devices without notches to keep the UI consistent
  double get extraPadBottom => viewPaddingOf.bottom > 0 ? 0 : 10;

  /// Returns a proportional height based on the screen height
  double heightBy([double value = 1]) => screenHeight * value;

  /// Returns a proportional width based on the screen height
  double widthBy([double value = 1]) => screenWidth * value;
}
