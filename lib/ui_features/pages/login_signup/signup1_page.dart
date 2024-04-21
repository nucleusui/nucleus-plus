import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Signup1Page extends StatelessWidget {
  const Signup1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        PrimaryAssetImage(
          AssetPaths.imgPlaceholder2,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          height: screenHeight(context) / 2.25,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(children: [
            const Text(
              'Start building your design system',
              style: AssetStyles.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.only(left: 12, right: 32),
              prefixIcon: const PrimaryAssetImage(AssetPaths.icApple),
              label: 'Continue with Apple',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              width: double.infinity,
              color: AssetColors.facebook,
              label: 'Continue with Facebook',
              padding: const EdgeInsets.only(left: 12, right: 32),
              prefixIcon: const PrimaryAssetImage(AssetPaths.icFacebook),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              width: double.infinity,
              color: AppColors.getColor(ColorKey.primary20),
              labelColor: AppColors.getColor(ColorKey.primary70),
              label: 'Continue with Email',
              onTap: () {},
            ),
          ]),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'By registering you agree to\nour ',
            style: AssetStyles.pXs.copyWith(
              height: 1.4,
              color: AppColors.getColor(ColorKey.grey50),
            ),
            children: [
              TextSpan(
                text: 'Terms of Use',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
