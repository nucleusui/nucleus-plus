import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Video3Page extends StatelessWidget {
  const Video3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            height: 375,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AssetPaths.imgPlaceholder1),
              ),
            ),
            child: PrimaryAppBar(
              leading: IconButton(
                splashRadius: 20,
                onPressed: () => Navigator.pop(context),
                icon: const UniversalImage(
                  AssetPaths.icArrowBack,
                  width: 8,
                  height: 16,
                  color: Colors.white,
                  fit: BoxFit.scaleDown,
                ),
              ),
              actions: const [
                UniversalImage(
                  AssetPaths.icShare,
                  width: 18,
                  color: Colors.white,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: UniversalImage(
              AssetPaths.icPlayFill,
              width: 28,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
        ]),
        Column(children: [
          const SizedBox(height: 24),
          const Text('Design System', style: AssetStyles.h1),
          const SizedBox(height: 4),
          const Text('1 Season', style: AssetStyles.pSm),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {},
            child: UniversalImage(
              AssetPaths.icBookmark,
              height: 16,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'S1 E1 · Design the foundation',
            style: AssetStyles.labelMd,
          ),
          const SizedBox(height: 8),
          Text(
            'Share easily between teams with our design\nsystem tools built for consistency.',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const SizedBox(height: 24),
          Button.primary(
            label: 'Watch',
            onTap: () {},
          ),
        ])
      ]),
    );
  }
}
