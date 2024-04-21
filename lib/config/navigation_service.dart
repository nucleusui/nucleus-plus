import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Timer? _loaderTimer;

Future<T?> nextScreen<T extends Object?>(Widget screen) async {
  return await navigatorKey.currentState!
      .push<T>(CupertinoPageRoute(builder: (context) => screen));
}

Future<void> nextReplace(Widget screen) async {
  await navigatorKey.currentState!
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));
}

Future<void> nextRemoveUntil(Widget screen) async {
  await navigatorKey.currentState!.pushAndRemoveUntil(
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: const Duration(seconds: 1),
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    ),
    (route) => false,
  );
}

void backScreen([dynamic result]) {
  navigatorKey.currentState!.pop(result);
}

void goBackUntil() {
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

void showLoader() {
  FocusManager.instance.primaryFocus?.unfocus();
  navigatorKey.currentState?.context.loaderOverlay.show();
  _loaderTimer?.cancel();
  _loaderTimer = Timer(const Duration(seconds: 8), () => hideLoader());
}

void hideLoader() {
  _loaderTimer?.cancel();
  navigatorKey.currentState?.context.loaderOverlay.hide();
}

Future<T?> showBottomSheet<T>(
  BuildContext context,
  Widget widget, {
  bool isScrollControlled = true,
  bool enableDrag = true,
  Color? backgroundColor,
  bool isDismissible = true,
}) async {
  return await showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor ?? Colors.white,
      isScrollControlled: isScrollControlled,
      shape: backgroundColor != null
          ? null
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
      builder: (BuildContext context) {
        return widget;
      });
}

Future<T?> showAlertDialog<T>(
  BuildContext context,
  Widget widget,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
