import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class FeatureInfo2Page extends StatefulWidget {
  const FeatureInfo2Page({super.key});

  @override
  State<FeatureInfo2Page> createState() => _FeatureInfo2PageState();
}

class _FeatureInfo2PageState extends State<FeatureInfo2Page> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.getColor(ColorKey.primary20),
            child: const PrimaryAssetImage(
              AssetPaths.icColumn,
              width: 42,
              height: 42,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Introducing\nDesign System',
            textAlign: TextAlign.center,
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const SizedBox(height: 32),
          ...[
            'Why people will like this feature',
            'What people will get from this feature',
            'Explain how simple the feature is',
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(children: [
                PrimaryAssetImage(
                  AssetPaths.icCheck,
                  width: 16,
                  color: AppColors.getColor(ColorKey.primary60),
                ),
                const SizedBox(width: 16),
                Text(e, style: AssetStyles.pMd),
              ]),
            );
          }),
          const Spacer(),
          Row(children: [
            const Text('Unlock Unlimited Access', style: AssetStyles.pMd),
            const Spacer(),
            CupertinoSwitch(
              value: isActive,
              onChanged: (value) => setState(() => isActive = value),
              activeTrackColor: AppColors.getColor(ColorKey.primary60),
            ),
          ]),
          const SizedBox(height: 16),
          PrimaryButton(
            onTap: () {},
            label: 'Continue',
          ),
        ]),
      ),
    );
  }
}
