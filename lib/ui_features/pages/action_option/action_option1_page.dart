import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class ActionOption1Page extends StatefulWidget {
  const ActionOption1Page({super.key});

  @override
  State<ActionOption1Page> createState() => _ActionOption1PageState();
}

class _ActionOption1PageState extends State<ActionOption1Page> {
  final listItem = [
    (icon: AssetPaths.icEmail, title: 'Send Email', onTap: () {}),
    (icon: AssetPaths.icChat, title: 'Send Message', onTap: () {}),
    (icon: AssetPaths.icUserBold, title: 'Invite Contacts', onTap: () {}),
    (icon: AssetPaths.icLink, title: 'Copy Invite Link', onTap: () {}),
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
      showDragHandle: false,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.grey10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
              color: AppColors.getColor(ColorKey.background),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: listItem.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 8),
                  child: PrimaryInkWell(
                    onTap: e.onTap,
                    child: Row(children: [
                      Text(e.title, style: AssetStyles.pMd),
                      const Spacer(),
                      PrimaryAssetImage(
                        e.icon,
                        width: 16,
                        color: AppColors.getColor(ColorKey.grey100),
                      ),
                    ]),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onTap: () => Navigator.pop(context),
            color: Colors.transparent,
            labelColor: AppColors.getColor(ColorKey.grey50),
            label: 'Cancel',
          ),
        ]),
      ),
    );
  }
}
