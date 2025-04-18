import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

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
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Show Bottom Sheet',
          buttonSize: ButtonSize.large,
          onPressed: () => showBottomSheet(context),
        ),
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
                      UniversalImage(
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
          Button.ghost(
            label: 'Cancel',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
        ]),
      ),
    );
  }
}
