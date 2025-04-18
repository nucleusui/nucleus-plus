import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Stories1Page extends StatefulWidget {
  const Stories1Page({super.key});

  @override
  State<Stories1Page> createState() => _Stories1PageState();
}

class _Stories1PageState extends State<Stories1Page> {
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
        title: 'Highlights',
        actions: [
          PrimaryInkWell(
            onTap: () {},
            child: UniversalImage(
              AssetPaths.icBookmark,
              width: 18,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Text(
                'How New York region became\nthe new epicenter',
                textAlign: TextAlign.center,
                style: AssetStyles.h2.copyWith(height: 1.2),
              ),
              const SizedBox(height: 16),
              Text(
                "Is New York City unique in the country’s coronavirus fight — or is it just one of the first?",
                textAlign: TextAlign.center,
                style: AssetStyles.pMd.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'by John Doe  ·  March 5, 2022',
                style: AssetStyles.h6,
              ),
            ]),
          ),
          Expanded(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              PageView.builder(
                padEnds: false,
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) =>
                    UniversalImage(stories[index], fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 20,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: stories.length,
                  onDotClicked: (index) {},
                  effect: ScrollingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    maxVisibleDots: 9,
                    activeDotColor: AppColors.getColor(ColorKey.primary60),
                    dotColor: Colors.white,
                    activeStrokeWidth: 0,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
