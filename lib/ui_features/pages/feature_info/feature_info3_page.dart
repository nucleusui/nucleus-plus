import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/dialog/primary_dialog.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class FeatureInfo3Page extends StatefulWidget {
  const FeatureInfo3Page({super.key});

  @override
  State<FeatureInfo3Page> createState() => _FeatureInfo3PageState();
}

class _FeatureInfo3PageState extends State<FeatureInfo3Page> {
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
      padding: EdgeInsets.zero,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        UniversalImage(
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
              Button.primary(
                label: 'Get Started',
                buttonSize: ButtonSize.full,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              Button.secondary(
                label: 'Maybe Later',
                buttonSize: ButtonSize.full,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
