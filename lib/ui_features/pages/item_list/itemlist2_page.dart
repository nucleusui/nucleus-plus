import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class ItemList2Page extends StatelessWidget {
  const ItemList2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Category', style: AssetStyles.h2),
            PrimaryInkWell(
              onTap: () {},
              child: Text(
                'See all',
                style: AssetStyles.h5.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 16),
          ...[
            (
              image: AssetPaths.imgPlaceholder1,
              title: 'Product category',
              description: 'Description',
            ),
            (
              image: AssetPaths.imgPlaceholder5,
              title: 'Product category',
              description: 'Description',
            ),
            (
              image: AssetPaths.imgPlaceholder2,
              title: 'Product category',
              description: 'Description',
            ),
            (
              image: AssetPaths.imgPlaceholder4,
              title: 'Product category',
              description: 'Description',
            ),
          ].map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UniversalImage(
                  e.image,
                  height: 200,
                  fit: BoxFit.cover,
                  width: screenWidth(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                const SizedBox(height: 12),
                Text(e.title, style: AssetStyles.h3),
                const SizedBox(height: 4),
                Text(
                  '\$${e.description}',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          })
        ],
      ),
    );
  }
}
