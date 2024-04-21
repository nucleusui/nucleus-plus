import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Article3Page extends StatelessWidget {
  const Article3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HEALTH',
              style: AssetStyles.h5.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'How to govern a\ndesign system that is\ncontinuously evolving',
              style: AssetStyles.h1.copyWith(height: 1.2),
            ),
            const SizedBox(height: 16),
            const Text(
              'By Wart Burggraaf - Jan 18, 2022',
              style: AssetStyles.pSm,
            ),
            const SizedBox(height: 24),
            PrimaryAssetImage(
              AssetPaths.imgPlaceholder2,
              height: 245,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(16),
              width: double.infinity,
            ),
            const SizedBox(height: 24),
            const Text(
              'While many understand the benefits of a design system—creating a structure built for scalability—some worry that they’ll lose flexibility. But there doesn’t have to be a tradeoff between consistency and creative freedom. In my experience leading a design systems team at a FinTech company, I learned the importance of opening up the design system for feedback, input, and exploration. Inviting every designer to challenge the status quo ultimately led to better components and a sense of real ownership.',
              style: AssetStyles.pMd,
            ),
          ],
        ),
      ),
    );
  }
}
