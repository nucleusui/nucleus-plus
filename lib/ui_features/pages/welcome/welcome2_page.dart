import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Welcome2Page extends StatelessWidget {
  const Welcome2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 82, 24, 24),
        child: Column(children: [
          Text(
            'Nucleus',
            style: AssetStyles.h3
                .copyWith(color: AppColors.getColor(ColorKey.primary60)),
          ),
          const SizedBox(height: 16),
          Text(
            'The ultimate UI components for your next project',
            textAlign: TextAlign.center,
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const Spacer(),
          const UniversalImage(
            AssetPaths.imgMinecraft,
            width: 250,
            height: 250,
          ),
          const Spacer(),
          Button.primary(
            label: 'Get Started',
            buttonSize: ButtonSize.full,
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
