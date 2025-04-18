import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class ActionOption2Page extends StatefulWidget {
  const ActionOption2Page({super.key});

  @override
  State<ActionOption2Page> createState() => _ActionOption2PageState();
}

class _ActionOption2PageState extends State<ActionOption2Page> {
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
      child: Column(children: [
        ...[
          'Upload Photo',
          'Discover Creators',
          'Share Profile',
          'Settings',
          'Log Out',
        ].map((e) {
          return PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: Column(children: [
              const SizedBox(height: 24),
              Text(
                e,
                style: AssetStyles.pMd.copyWith(
                  color: e == 'Log Out'
                      ? AssetColors.red
                      : AppColors.getColor(ColorKey.primary70),
                ),
              ),
              const SizedBox(height: 24),
              const PrimaryDivider(),
            ]),
          );
        }),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Button.ghost(
            label: 'Cancel',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ]),
    );
  }
}
