import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';

void primaryDialog(
  BuildContext context, {
  Widget? child,
  double radius = 10,
  EdgeInsetsGeometry? padding = const EdgeInsets.all(16),
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog(
      surfaceTintColor: AppColors.getColor(ColorKey.background),
      insetPadding: const EdgeInsets.all(16),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Container(
        width: double.infinity,
        padding: padding,
        constraints: BoxConstraints(
          maxHeight:
              screenHeight(context) - MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: child,
      ),
    ),
  );
}
