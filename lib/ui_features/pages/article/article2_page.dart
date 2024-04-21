import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Article2Page extends StatelessWidget {
  const Article2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryInkWell(
          onTap: () {},
          child: PrimaryAssetImage(
            AssetPaths.icBookmark,
            width: 16,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 20),
        PrimaryInkWell(
          onTap: () {},
          child: PrimaryAssetImage(
            AssetPaths.icShare,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Text(
            'Typography',
            style: AssetStyles.h1,
          ),
          const SizedBox(height: 24),
          const Text(
            'Typography is one of the most important aspects of your design system to establish early on—think of how much information you\'ll communicate to users through type.',
            textAlign: TextAlign.left,
            style: AssetStyles.pMd,
          ),
          const SizedBox(height: 24),
          PrimaryAssetImage(
            AssetPaths.imgPlaceholder26,
            height: 375,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(16),
            width: double.infinity,
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'Design System',
              style: AssetStyles.pXs
                  .copyWith(color: AppColors.getColor(ColorKey.grey50)),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'There are many considerations when choosing typefaces, especially for use on-screen. You may also need to work cross-functionally with brand/marketing teams to accommodate your brand\'s typefaces and determine how they\'ll fit into your system. Typefaces can be another touchpoint to help subtly convey the right tone and personality throughout your digital experiences. If your brand has a very unique typeface, not ideal for extended reading or small sizes, you may opt to reserve it for display sizes for elements like headlines that are used less frequently. ',
            style: AssetStyles.pMd,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
