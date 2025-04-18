import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Product2Page extends StatefulWidget {
  const Product2Page({super.key});

  @override
  State<Product2Page> createState() => _Product2PageState();
}

class _Product2PageState extends State<Product2Page> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icShare,
            width: 18,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Product Name', style: AssetStyles.h2),
                const SizedBox(height: 5),
                Row(children: [
                  RatingBar.builder(
                    itemSize: 16,
                    initialRating: 5,
                    allowHalfRating: false,
                    glowColor: Colors.amber,
                    direction: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const UniversalImage(AssetPaths.icStarFill),
                    onRatingUpdate: (value) {},
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '404 reviews',
                    style: AssetStyles.pSm.copyWith(
                      color: AppColors.getColor(ColorKey.grey60),
                    ),
                  ),
                  const Spacer(),
                  UniversalImage(
                    AssetPaths.icLove,
                    width: 16,
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: screenWidth(context) - 48,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              PageView.builder(
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) => setState(() => currentIndex = value),
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: UniversalImage(
                    AssetPaths.imgPlaceholder1,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Wrap(
                  spacing: 5,
                  alignment: WrapAlignment.center,
                  children: List.generate(5, (index) {
                    return UniversalImage(
                      AssetPaths.icCircleFill,
                      width: 8,
                      color: Colors.white
                          .withValues(alpha: index == currentIndex ? 1 : .5),
                    );
                  }).toList(),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\$89.00', style: AssetStyles.h3),
                Text(
                  'Add-on services',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Add to Cart',
          buttonSize: ButtonSize.full,
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
