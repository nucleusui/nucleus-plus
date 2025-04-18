import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/dialog/primary_dialog.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Permission2Page extends StatefulWidget {
  const Permission2Page({super.key});

  @override
  State<Permission2Page> createState() => _Permission2PageState();
}

class _Permission2PageState extends State<Permission2Page> {
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

  void showBottomSheet(BuildContext context) {
    return primaryDialog(
      context,
      radius: 16,
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'Don’t miss a thing',
          textAlign: TextAlign.center,
          style: AssetStyles.h2.copyWith(height: 1.2),
        ),
        const SizedBox(height: 8),
        Text(
          'Allow push notifications to get alerts for\nnew releases, relevant offers, account\ninformation and updates.',
          textAlign: TextAlign.center,
          style: AssetStyles.pMd.copyWith(
            color: AppColors.getColor(ColorKey.grey60),
          ),
        ),
        const SizedBox(height: 24),
        Button.primary(
          label: 'Allow notifications',
          buttonSize: ButtonSize.full,
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(height: 8),
        Button.ghost(
          label: 'Allow notifications',
          buttonSize: ButtonSize.full,
          onPressed: () => Navigator.pop(context),
        ),
      ]),
    );
  }
}
