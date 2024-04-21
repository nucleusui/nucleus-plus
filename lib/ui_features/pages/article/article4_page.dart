import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Article4Page extends StatelessWidget {
  const Article4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 56,
        child: PrimaryAppBar(
          iconColor: AppColors.getColor(ColorKey.grey100),
          actions: [
            PrimaryInkWell(
              onTap: () {},
              child: PrimaryAssetImage(
                AssetPaths.icBookmark,
                width: 16,
                color: AppColors.getColor(ColorKey.grey100),
              ),
            ),
            const SizedBox(width: 16),
            PrimaryInkWell(
              onTap: () {},
              child: const PrimaryAssetImage(AssetPaths.icShare),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          const PrimaryAssetImage(
            AssetPaths.imgPlaceholder4,
            height: 245,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'How a small team built figma.com’s design system',
                style: AssetStyles.h1.copyWith(height: 1.2),
              ),
              const SizedBox(height: 24),
              const Text('By Figma', style: AssetStyles.h5),
              const SizedBox(height: 4),
              Text(
                'Updated 0701 GMT (1501 HKT) January 16, 2022',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '''Figma is a collaborative interface design tool that gives individuals and teams a better way to design, but when we did an audit of our marketing pages, we discovered we weren’t heeding our own advice. Our site had a lot of inconsistencies.
                      
While many understand the benefits of a design system—creating a structure built for scalability—some worry that they’ll lose flexibility. But there doesn’t have to be a tradeoff between consistency and creative freedom. In my experience leading a design systems team at a''',
                style: AssetStyles.pMd,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
