import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';

Future<void> primaryBottomSheet(
  BuildContext context, {
  required Widget child,
  bool showDragHandle = true,
  Color? backgroundColor,
}) {
  FocusScope.of(context).unfocus();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: showDragHandle,
    backgroundColor: backgroundColor ?? AppColors.getColor(ColorKey.background),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (_) => ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          color: AppColors.getColor(ColorKey.background),
          child: child,
        ),
      ),
    ),
  );
}
