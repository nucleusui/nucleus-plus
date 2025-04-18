import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class AugemntedReality1Page extends StatelessWidget {
  const AugemntedReality1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey10),
      body: Stack(alignment: Alignment.center, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 128),
          child: UniversalImage(
            AssetPaths.imgPlaceholder12,
            width: 174,
          ),
        ),
        PrimaryAppBar(
          leading: PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: UniversalImage(
                AssetPaths.icClose,
                width: 16,
                fit: BoxFit.scaleDown,
                color: AppColors.getColor(ColorKey.grey100),
              ),
            ),
          ),
          actions: [
            UniversalImage(
              AssetPaths.icMore,
              width: 22,
              fit: BoxFit.scaleDown,
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ],
        ),
      ]),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.background),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.getColor(ColorKey.grey30),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Rolleiflex", style: AssetStyles.h3),
                  PrimaryInkWell(
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: UniversalImage(
                        AssetPaths.icClose,
                        width: 14,
                        fit: BoxFit.scaleDown,
                        color: AppColors.getColor(ColorKey.grey100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 16,
                children: [
                  AssetPaths.imgPlaceholder13,
                  AssetPaths.imgPlaceholder14,
                  AssetPaths.imgPlaceholder15,
                  AssetPaths.imgPlaceholder16,
                  AssetPaths.imgPlaceholder13,
                  AssetPaths.imgPlaceholder14,
                ].map((e) => UniversalImage(e, width: 76)).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Not all colors are avaliable for this feature.",
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
