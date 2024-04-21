import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/dialog/primary_dialog.dart';

class Permission2Page extends StatefulWidget {
  const Permission2Page({super.key});

  @override
  State<Permission2Page> createState() => _Permission2PageState();
}

class _Permission2PageState extends State<Permission2Page> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showModalDialog(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            label: 'Show Modal Dialog',
            onTap: () => showModalDialog(context),
          ),
        ]),
      ),
    );
  }

  void showModalDialog(BuildContext context) {
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
        PrimaryButton(
          label: 'Allow notifications',
          onTap: () {},
        ),
        const SizedBox(height: 8),
        PrimaryButton(
          label: 'Set up later',
          color: AppColors.getColor(ColorKey.background),
          labelColor: AppColors.getColor(ColorKey.primary70),
          onTap: () => Navigator.pop(context),
        ),
      ]),
    );
  }
}
