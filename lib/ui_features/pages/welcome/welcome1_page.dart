import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Welcome1Page extends StatelessWidget {
  const Welcome1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        PrimaryAssetImage(
          AssetPaths.imgPlaceholder1,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          height: screenHeight(context) / 2,
        ),
        const SizedBox(height: 24),
        const Text('Design better', style: AssetStyles.h1),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: PrimaryButton(
            width: double.infinity,
            label: 'Get Started',
            onTap: () {},
          ),
        ),
        Stack(alignment: Alignment.center, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PrimaryDivider(),
          ),
          Container(
            color: AppColors.getColor(ColorKey.background),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'OR CONTINUE WITH',
              style: AssetStyles.labelXs.copyWith(
                color: AppColors.getColor(ColorKey.grey50),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ]),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          children: [
            AssetPaths.logoApple,
            AssetPaths.logoFacebook,
            AssetPaths.logoGoogle,
            AssetPaths.logoTwitter,
          ].map((e) {
            return IconRoundedButton(
              icon: e,
              borderColor: Colors.transparent,
              onTap: () {},
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Have an account? ',
            style: AssetStyles.pMd.copyWith(height: 1.4),
            children: [
              TextSpan(
                text: 'Log in',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.primary70),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'By registering you agree to\nour ',
            style: AssetStyles.pXs.copyWith(height: 1.4),
            children: [
              TextSpan(
                text: 'Terms of Use',
                style: AssetStyles.pXs
                    .copyWith(color: AppColors.getColor(ColorKey.primary70)),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: AssetStyles.pXs
                    .copyWith(color: AppColors.getColor(ColorKey.primary70)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ]),
    );
  }
}