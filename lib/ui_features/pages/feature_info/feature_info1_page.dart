import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class FeatureInfo1Page extends StatefulWidget {
  const FeatureInfo1Page({super.key});

  @override
  State<FeatureInfo1Page> createState() => _FeatureInfo1PageState();
}

class _FeatureInfo1PageState extends State<FeatureInfo1Page> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: PrimaryAssetImage(
              AssetPaths.icClose,
              width: 16,
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Introducing\nDesign System',
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const SizedBox(height: 24),
          ...[
            (
              icon: AssetPaths.icMenu,
              title: 'First benefit information',
              subtitle:
                  'Explain more about the first benefit why people should sync their account.',
            ),
            (
              icon: AssetPaths.icPlus,
              title: 'Second benefit information',
              subtitle: 'Maybe one isn’t enough, we got another benefit here.',
            ),
            (
              icon: AssetPaths.icPlusOutlined,
              title: 'Third benefit information',
              subtitle: 'This is the third benefit.',
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.getColor(ColorKey.primary20),
                  child: PrimaryAssetImage(
                    e.icon,
                    width: 16,
                    color: AppColors.getColor(ColorKey.primary70),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title, style: AssetStyles.h4),
                      const SizedBox(height: 4),
                      Text(
                        e.subtitle,
                        style: AssetStyles.pSm.copyWith(
                          color: AppColors.getColor(ColorKey.grey60),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }),
          SizedBox(height: screenHeight(context) / 4),
          PrimaryButton(
            label: 'Get Started',
            onTap: () {},
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
