import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Welcome3Page extends StatelessWidget {
  const Welcome3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 82, 24, 24),
          child: Column(
            children: [
              Text(
                'Design better\nwith Nucleus',
                textAlign: TextAlign.center,
                style: AssetStyles.h1.copyWith(height: 1.2),
              ),
              const SizedBox(height: 16),
              Text(
                'Join over 100 million people who use\nNucleus to design better UI',
                textAlign: TextAlign.center,
                style: AssetStyles.pLg
                    .copyWith(color: AppColors.getColor(ColorKey.grey60)),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: 'Get started',
                width: double.infinity,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Log in',
                labelStyle: AssetStyles.labelMd
                    .copyWith(color: AppColors.getColor(ColorKey.primary60)),
                width: double.infinity,
                color: Colors.transparent,
                onTap: () {},
              ),
            ],
          ),
        ),
        const Spacer(),
        PrimaryAssetImage(
          AssetPaths.imgPlaceholder2,
          width: double.infinity,
          fit: BoxFit.cover,
          height: screenHeight(context) / 1.85,
        ),
      ]),
    );
  }
}
