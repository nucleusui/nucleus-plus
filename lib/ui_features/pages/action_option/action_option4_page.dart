import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class ActionOptio4Page extends StatefulWidget {
  const ActionOptio4Page({super.key});

  @override
  State<ActionOptio4Page> createState() => _ActionOptio4PageState();
}

class _ActionOptio4PageState extends State<ActionOptio4Page> {
  final listItem = [
    (icon: AssetPaths.icChat, title: 'Reply', onTap: () {}),
    (icon: AssetPaths.icHashtag, title: 'Create Thread', onTap: () {}),
    (icon: AssetPaths.icCopy, title: 'Copy Text', onTap: () {}),
    (icon: AssetPaths.icDelete, title: 'Delete Message', onTap: () {}),
    (icon: AssetPaths.icStarBold, title: 'Star Message', onTap: () {}),
    (icon: AssetPaths.icWarning, title: 'Report', onTap: () {}),
    (icon: AssetPaths.icSettingBold, title: 'Settings', onTap: () {})
  ];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            label: 'Show Bottom Sheet',
            onTap: () => showBottomSheet(context),
          ),
        ]),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 12,
            children: [
              AssetPaths.emojiLaugh,
              AssetPaths.emojiGood,
              AssetPaths.emoji100,
              AssetPaths.emojiScare,
              AssetPaths.emojiEye,
              AssetPaths.emojiCheck,
            ].map((e) {
              return CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.getColor(ColorKey.grey10),
                child: PrimaryAssetImage(
                  e,
                  width: 24,
                  height: 29,
                  fit: BoxFit.contain,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
        ...listItem.map((e) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: PrimaryInkWell(
              onTap: e.onTap,
              child: Row(children: [
                Container(
                  width: 28,
                  padding: const EdgeInsets.all(4),
                  child: PrimaryAssetImage(
                    e.icon,
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                const SizedBox(width: 12),
                Text(e.title, style: AssetStyles.pMd),
              ]),
            ),
          );
        }),
        const SizedBox(height: 24),
      ]),
    );
  }
}
