import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/input/pin_textfield.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Verification1Page extends StatelessWidget {
  const Verification1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        Text(
          'Enter the code',
          style: AssetStyles.h1.copyWith(height: 1.2),
        ),
        const SizedBox(height: 16),
        Text(
          'We sent you a 4 digit code at\n+1 501-555-0100',
          textAlign: TextAlign.center,
          style: AssetStyles.pMd
              .copyWith(color: AppColors.getColor(ColorKey.grey50)),
        ),
        const SizedBox(height: 32),
        PinTextField(
          length: 4,
          onCompleted: (value) {
            debugPrint('pin value: $value');
            FocusManager().primaryFocus?.unfocus();
          },
        ),
        const SizedBox(height: 16),
        Text(
          'Resend',
          style: AssetStyles.h4
              .copyWith(color: AppColors.getColor(ColorKey.primary60)),
        ),
        const Spacer(),
        const SizedBox(height: 32),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Button.outline(
        icon: UniversalImage(AssetPaths.icArrowLeft),
        onPressed: () => backScreen(),
      ),
    );
  }
}
