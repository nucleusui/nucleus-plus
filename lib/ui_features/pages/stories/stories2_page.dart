import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Stories2Page extends StatefulWidget {
  const Stories2Page({super.key});

  @override
  State<Stories2Page> createState() => _Stories2PageState();
}

class _Stories2PageState extends State<Stories2Page> {
  final controller = PageController(keepPage: true, initialPage: 5);
  final stories = [
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
    AssetPaths.imgPlaceholder2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleWidget: SmoothPageIndicator(
          controller: controller,
          count: stories.length,
          onDotClicked: (index) {},
          effect: ScrollingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            maxVisibleDots: 5,
            activeDotScale: 1,
            activeStrokeWidth: 0,
            activeDotColor: AppColors.getColor(ColorKey.primary60),
            dotColor: Colors.grey.shade300,
          ),
        ),
      ),
      body: ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        const SizedBox(height: 16),
        SizedBox(
          width: screenWidth(context),
          height: screenWidth(context),
          child: PageView.builder(
            padEnds: false,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryAssetImage(
                stories[index],
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            children: [
              Row(children: [
                const PrimaryAssetImage(
                  AssetPaths.imgUser1,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('James Ryan', style: AssetStyles.h5),
                    Text(
                      '31.6M subscribers',
                      style: AssetStyles.pXs.copyWith(
                        color: AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 16),
              Text(
                'Design 101: How to map user journey',
                style: AssetStyles.h2.copyWith(height: 1.2),
              ),
              const SizedBox(height: 16),
              const Text(
                'All design systems employ constraint, but how do they differ? One comparison point is how dynamically they’re consumed.',
                style: AssetStyles.pMd,
              ),
            ],
          ),
        ),
      ]),
      bottomSheet: Container(
        height: 70,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        decoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.primary60),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(children: [
          Text(
            '2.4K views',
            style: AssetStyles.pMd.copyWith(color: Colors.white),
          ),
          const Spacer(),
          Wrap(
            spacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              (icon: AssetPaths.icMore, width: 16),
              (icon: AssetPaths.icLike, width: 16),
              (icon: AssetPaths.icBookmark, width: 14),
              (icon: AssetPaths.icShare, width: 14),
            ].map((e) {
              return PrimaryAssetImage(
                e.icon,
                width: e.width.toDouble(),
                color: Colors.white,
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
