import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.height = 48,
    this.width,
    this.color,
    this.labelColor,
    this.radius = 30,
    this.loading = false,
    this.transparent = false,
    this.padding,
    this.labelStyle,
    this.border,
    this.prefixIcon,
  });

  final double height;
  final double? width;
  final String label;
  final Color? color;
  final Color? labelColor;
  final Function()? onTap;
  final double radius;
  final bool loading;
  final bool transparent;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;
  final BorderSide? border;
  final Widget? prefixIcon;

  @override
  State<PrimaryButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<PrimaryButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onTap,
        onHover: (value) {
          if (kIsWeb || Platform.isMacOS) setState(() => isHover = value);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          padding: widget.padding,
          shadowColor: Colors.transparent,
          side: widget.border,
          surfaceTintColor: widget.transparent
              ? Colors.transparent
              : AppColors.getColor(ColorKey.primary20),
          foregroundColor: widget.transparent
              ? Colors.white
              : AppColors.getColor(ColorKey.primary90),
          disabledBackgroundColor: widget.transparent
              ? Colors.transparent
              : AppColors.getColor(ColorKey.grey30),
          backgroundColor: widget.transparent
              ? Colors.transparent
              : isHover
                  ? widget.color ?? AppColors.getColor(ColorKey.primary70)
                  : widget.loading
                      ? AppColors.getColor(ColorKey.primary20)
                      : widget.color ?? AppColors.getColor(ColorKey.primary60),
        ),
        child: widget.loading
            ? CupertinoActivityIndicator(
                color: AppColors.getColor(ColorKey.primary70))
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (widget.prefixIcon != null) widget.prefixIcon!,
                if (widget.prefixIcon != null) const Spacer(),
                Text(
                  widget.label,
                  style: widget.labelStyle ??
                      AssetStyles.h4.copyWith(
                        color: widget.labelColor ??
                            (widget.onTap == null
                                ? AppColors.getColor(ColorKey.grey50)
                                : Colors.white),
                      ),
                ),
                if (widget.prefixIcon != null) const Spacer(),
              ]),
      ),
    );
  }
}
