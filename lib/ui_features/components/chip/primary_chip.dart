import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class PrimaryChip extends StatelessWidget {
  const PrimaryChip({
    super.key,
    this.text = "",
    this.height = 40,
    this.radius = 100,
    this.onTap,
    this.isActive = false,
    this.alignment = Alignment.center,
    this.stackAlignment = Alignment.centerRight,
    this.padding,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.textColor,
    this.border,
  });

  final String text;
  final double height;
  final double radius;
  final bool isActive;
  final Function()? onTap;
  final AlignmentGeometry alignment;
  final AlignmentGeometry stackAlignment;
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final Widget? actions;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: PrimaryInkWell(
        onTap: onTap,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor ??
                (isActive
                    ? AppColors.getColor(ColorKey.primary60)
                    : onTap == null
                        ? AppColors.getColor(ColorKey.grey20)
                        : AppColors.getColor(ColorKey.primary20)),
          ),
          child: Stack(alignment: stackAlignment, children: [
            Container(
              padding: padding,
              alignment: alignment,
              child: Text(
                text,
                style: AssetStyles.h4.copyWith(
                  color: textColor ??
                      (isActive
                          ? Colors.white
                          : onTap == null
                              ? AppColors.getColor(ColorKey.grey50)
                              : AppColors.getColor(ColorKey.primary70)),
                ),
              ),
            ),
            if (leading != null) leading!,
            if (actions != null) actions!,
          ]),
        ),
      ),
    );
  }
}
