import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Article1Page extends StatefulWidget {
  const Article1Page({super.key});

  @override
  State<Article1Page> createState() => _Article1PageState();
}

class _Article1PageState extends State<Article1Page> {
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
          Center(
            child: Text(
              'DESIGN SYSTEM',
              style: AssetStyles.h5.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'White-labeling: putting the \ndesign system in user\' \nhands',
            textAlign: TextAlign.center,
            style: AssetStyles.h2,
          ),
          const SizedBox(height: 16),
          const Text(
            'The era of design systems is booming, and \nwith good reason.',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd,
          ),
          const SizedBox(height: 16),
          const Center(child: Text('By Mike Fix', style: AssetStyles.h4)),
          const SizedBox(height: 24),
          PrimaryAssetImage(
            AssetPaths.imgPlaceholder2,
            height: 242,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(16),
            width: double.infinity,
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'Photography by Kristy Kravcenko - Unsplash',
              style: AssetStyles.pXs.copyWith(
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'All design systems employ raint, but how do they differ? One Comparison point is how dynamically they\'re consumed. For example, a basic design system could be implemented as a component kit built within another project. On the other end of the spectrum, a complex system may be dynamically consumed through something like a CMS.\n\nFor a client of ours, we were tasked with building something in between',
            style: AssetStyles.pMd,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
