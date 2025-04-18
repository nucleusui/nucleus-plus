import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

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
              Button.primary(
                label: 'Get started',
                buttonSize: ButtonSize.full,
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              Button.ghost(
                label: 'Log in',
                buttonSize: ButtonSize.full,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: UniversalImage(
            AssetPaths.imgPlaceholder2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
