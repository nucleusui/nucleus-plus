import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class Walktrough3Page extends StatefulWidget {
  const Walktrough3Page({super.key});

  @override
  State<Walktrough3Page> createState() => _Walktrough3PageState();
}

class _Walktrough3PageState extends State<Walktrough3Page> {
  int currentIndex = 0;
  final listItems = [
    (
      image: AssetPaths.imgFire,
      title: 'Do more with Nucleus',
      subtitle:
          'Full access to 1000+ UI components, Style library, icons and illustration.',
    ),
    (
      image: AssetPaths.imgMinecraft,
      title: 'Sint incididunt magna culpa voluptate deserunt sunt',
      subtitle:
          'Nulla nisi exercitation nisi amet in in amet minim est consequat.',
    ),
    (
      image: AssetPaths.imgPaint,
      title: 'Velit Lorem ad Lorem occaecat est ullamco ullamco',
      subtitle: 'Commodo culpa magna tempor consequat est nostrud enim minim.',
    ),
    (
      image: AssetPaths.imgToggle,
      title: 'Est ut eu sunt id est culpa eiusmod nulla aliqua et',
      subtitle: 'Culpa excepteur tempor do sit commodo duis velit non elit id.',
    ),
    (
      image: AssetPaths.imgMinecraft,
      title: 'Anim ad sunt culpa culpa aliquip pariatur ipsum',
      subtitle: 'Qui mollit anim non amet nostrud et ea magna nostrud commodo.',
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            width: null,
            label: 'Show Bottom Sheet',
            onTap: () => showBottomSheet(context),
          ),
        ]),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Column(children: [
          SizedBox(
            height: screenHeight(context) / 2,
            child: PageView.builder(
              itemCount: listItems.length,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              onPageChanged: (index) =>
                  setInnerState(() => currentIndex = index),
              itemBuilder: (context, index) => Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    listItems[index].title,
                    textAlign: TextAlign.center,
                    style: AssetStyles.h2.copyWith(height: 1.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Text(
                    listItems[index].subtitle,
                    textAlign: TextAlign.center,
                    style: AssetStyles.pMd,
                  ),
                ),
                const Spacer(),
                PrimaryAssetImage(listItems[index].image,
                    width: 200, height: 200),
                const Spacer(),
              ]),
            ),
          ),
          Text(
            'Swipe to Explore',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            children: listItems.asMap().entries.map((e) {
              return Icon(
                Icons.circle,
                size: 10,
                color: currentIndex == e.key
                    ? AppColors.getColor(ColorKey.primary60)
                    : AppColors.getColor(ColorKey.grey20),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
        ]);
      }),
    );
  }
}
