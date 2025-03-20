import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class IconRoundedButton extends StatelessWidget {
  const IconRoundedButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.width = 50,
    this.height = 50,
    this.color,
    this.borderColor,
    this.iconColor,
    this.iconSize,
  });

  final String icon;
  final double? width;
  final double? height;
  final Function() onTap;
  final Color? color;
  final Color? borderColor;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return PrimaryInkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: borderColor ??
                AppColors.getColor(ColorKey.grey100).withValues(alpha: .2),
          ),
        ),
        child: Center(
          child: PrimaryAssetImage(
            icon,
            color: iconColor,
            width: iconSize,
            height: iconSize,
          ),
        ),
      ),
    );
  }
}
