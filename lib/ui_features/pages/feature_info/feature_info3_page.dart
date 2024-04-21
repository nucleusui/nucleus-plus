import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/dialog/primary_dialog.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class FeatureInfo3Page extends StatefulWidget {
  const FeatureInfo3Page({super.key});

  @override
  State<FeatureInfo3Page> createState() => _FeatureInfo3PageState();
}

class _FeatureInfo3PageState extends State<FeatureInfo3Page> {
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
      padding: EdgeInsets.zero,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        PrimaryAssetImage(
          AssetPaths.imgPlaceholder1,
          height: screenHeight(context) / 3,
          fit: BoxFit.cover,
          width: double.infinity,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            children: [
              Text(
                'Introducing\nDesign System',
                textAlign: TextAlign.center,
                style: AssetStyles.h1.copyWith(height: 1.2),
              ),
              const SizedBox(height: 16),
              Text(
                'Allow push notifications to get alerts for\nnew releases, offers, account information\nand updates.',
                textAlign: TextAlign.center,
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Get Started',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Maybe Later',
                color: AppColors.getColor(ColorKey.primary20),
                labelColor: AppColors.getColor(ColorKey.primary70),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
