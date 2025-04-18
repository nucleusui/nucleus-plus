import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class PrimaryRadio extends StatelessWidget {
  const PrimaryRadio({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.selected,
    this.onTap,
    this.divider = true,
    this.titleStyle = AssetStyles.pMd,
  });

  final String title;
  final String? subtitle;
  final String? icon;
  final bool? selected;
  final Function()? onTap;
  final bool divider;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return PrimaryInkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: divider
              ? Border(
                  bottom:
                      BorderSide(color: AppColors.getColor(ColorKey.grey20)))
              : null,
        ),
        child: Row(children: [
          if (icon != null) ...[
            UniversalImage(icon!, width: 24, height: 24),
            const SizedBox(width: 16),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: AssetStyles.pMd.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                )
              ],
            ],
          ),
          const Spacer(),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: selected ?? false ? 8 : 1,
                color: selected ?? false
                    ? AppColors.getColor(ColorKey.primary60)
                    : AppColors.getColor(ColorKey.grey30),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
