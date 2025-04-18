import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Welcome4Page extends StatelessWidget {
  const Welcome4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey10),
      body: Column(children: [
        const Spacer(),
        const UniversalImage(
          AssetPaths.imgToggle,
          width: 280,
          height: 280,
        ),
        const Spacer(),
        Container(
          color: AppColors.getColor(ColorKey.background),
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
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
              const SizedBox(height: 48),
              Row(children: [
                Expanded(
                  child: Button.secondary(
                    label: 'Log in',
                    buttonSize: ButtonSize.large,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Button.primary(
                    label: 'Get started',
                    buttonSize: ButtonSize.large,
                    onPressed: () {},
                  ),
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
