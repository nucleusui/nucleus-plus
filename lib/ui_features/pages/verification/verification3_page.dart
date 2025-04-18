import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Verification3Page extends StatelessWidget {
  const Verification3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Spacer(),
          const UniversalImage(
            AssetPaths.imgCheck,
            height: 250,
            width: 250,
          ),
          const SizedBox(height: 16),
          const Text(
            'Verify your email',
            textAlign: TextAlign.center,
            style: AssetStyles.h2,
          ),
          const SizedBox(height: 8),
          Text(
            'Please check your email and follow the instructions to verify your account.',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey50)),
          ),
          const Spacer(),
          Button.primary(
            label: 'Open my email',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
          Button.secondary(
            label: 'Resend verification',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
        ]),
      ),
    );
  }
}
