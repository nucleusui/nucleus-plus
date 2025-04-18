import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Signup1Page extends StatelessWidget {
  const Signup1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        UniversalImage(
          AssetPaths.imgPlaceholder2,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          height: screenHeight(context) / 2.25,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            spacing: 16,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Start building your design system',
                  style: AssetStyles.h1,
                  textAlign: TextAlign.center,
                ),
              ),
              Button.social(
                label: 'Continue with Apple',
                color: Colors.black,
                prefixIcon: const UniversalImage(AssetPaths.icApple),
                onTap: () {},
              ),
              Button.social(
                label: 'Continue with Facebook',
                color: AssetColors.facebook,
                prefixIcon: const UniversalImage(AssetPaths.icFacebook),
                onTap: () {},
              ),
              Button.secondary(
                label: 'Continue with Email',
                buttonSize: ButtonSize.full,
                onTap: () {},
              ),
            ],
          ),
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
