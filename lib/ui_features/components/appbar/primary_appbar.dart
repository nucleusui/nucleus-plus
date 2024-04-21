import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    this.backgroundColor,
    this.heightAppBar = kToolbarHeight,
    this.title,
    this.leading,
    this.elevation,
    this.actions,
    this.onTapBack,
    this.titleStyle = AssetStyles.h3,
    this.iconColor,
    this.titleWidget,
    this.systemOverlayStyle =
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    this.hideLeading = false,
    this.icon = AssetPaths.icArrowBack,
    this.centerTitle = true,
    this.shadowColor,
    this.surfaceTintColor = Colors.transparent,
    this.useActionPadding = true,
    this.bottomWidget,
  });

  final Color? backgroundColor;
  final double heightAppBar;
  final String? title;
  final Widget? leading;
  final double? elevation;
  final List<Widget>? actions;
  final Function()? onTapBack;
  final TextStyle titleStyle;
  final Color? iconColor;
  final Widget? titleWidget;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool hideLeading;
  final String icon;
  final bool centerTitle;
  final Color? shadowColor;
  final Color surfaceTintColor;
  final bool useActionPadding;
  final PreferredSizeWidget? bottomWidget;

  @override
  Size get preferredSize => Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      surfaceTintColor: surfaceTintColor,
      systemOverlayStyle: systemOverlayStyle,
      title: titleWidget ?? Text(title ?? "", style: titleStyle),
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottomOpacity: 0,
      elevation: elevation,
      shadowColor: shadowColor,
      bottom: bottomWidget,
      actions: actions == null
          ? null
          : [
              ...actions!,
              if (useActionPadding) ...[const SizedBox(width: 16)]
            ],
      leading: hideLeading
          ? null
          : leading ??
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  if (onTapBack != null) {
                    onTapBack!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: PrimaryAssetImage(
                  icon,
                  width: 8,
                  height: 16,
                  color: iconColor ?? AppColors.getColor(ColorKey.primary60),
                ),
              ),
    );
  }
}
