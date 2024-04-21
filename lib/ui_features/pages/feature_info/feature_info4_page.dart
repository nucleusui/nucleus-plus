import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class FeatureInfo4Page extends StatelessWidget {
  const FeatureInfo4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            PrimaryAssetImage(
              AssetPaths.imgPlaceholder2,
              height: screenHeight(context) / 3.5,
              fit: BoxFit.cover,
              width: double.infinity,
              borderRadius: BorderRadius.circular(16),
            ),
            const SizedBox(height: 24),
            Text(
              'Experience design system by\nNucleus',
              textAlign: TextAlign.center,
              style: AssetStyles.h2.copyWith(height: 1.2),
            ),
            const SizedBox(height: 16),
            Text(
              'Share easily between teams with our design system tools built for consistency.',
              textAlign: TextAlign.center,
              style: AssetStyles.pMd.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            const SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              PrimaryButton(
                onTap: () {},
                label: 'Get Started',
              ),
            ]),
            const Spacer(),
            const Text('Try later?', style: AssetStyles.pMd),
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                'Back to home',
                style: AssetStyles.h4.copyWith(
                  color: AppColors.getColor(ColorKey.primary70),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
