import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/extension/context.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class ChatTextfield extends StatelessWidget {
  const ChatTextfield({
    super.key,
    this.icon = AssetPaths.icPlus,
    this.backgroundColor,
    this.iconColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81,
      margin: EdgeInsets.only(bottom: context.extraPadBottom),
      decoration: BoxDecoration(
        color: AppColors.getColor(ColorKey.background),
        border: Border(
          top: BorderSide(color: AppColors.getColor(ColorKey.grey20)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          prefixIcon ??
              CircleAvatar(
                backgroundColor:
                    backgroundColor ?? AppColors.getColor(ColorKey.grey20),
                radius: 16,
                child: Center(child: UniversalImage(icon, color: iconColor)),
              ),
          const SizedBox(width: 16),
          const Expanded(
            child: InputField(
              hintText: 'Placeholder text',
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
        ]),
      ),
    );
  }
}
