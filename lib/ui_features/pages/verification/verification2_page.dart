import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Verification2Page extends StatelessWidget {
  const Verification2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Ok, check your texts!',
            textAlign: TextAlign.center,
            style: AssetStyles.h3.copyWith(
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
          Text(
            'we sent you a verification code.',
            textAlign: TextAlign.center,
            style: AssetStyles.h3.copyWith(
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
          const SizedBox(height: 24),
          const TextFields(
            autofocus: true,
            hintText: "Text you just entered",
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: "Didn't receive it? ",
              style: AssetStyles.pSm.copyWith(
                  height: 1.4, color: AppColors.getColor(ColorKey.grey50)),
              children: [
                TextSpan(
                  text: 'Tap to resend',
                  style: AssetStyles.h5
                      .copyWith(color: AppColors.getColor(ColorKey.primary60)),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Continue',
          buttonSize: ButtonSize.full,
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
