import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class NewsFeed5Page extends StatefulWidget {
  const NewsFeed5Page({super.key});

  @override
  State<NewsFeed5Page> createState() => _NewsFeed5PageState();
}

class _NewsFeed5PageState extends State<NewsFeed5Page> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'News', hideLeading: true, actions: [
        PrimaryInkWell(
          onTap: () {},
          child: PrimaryAssetImage(
            AssetPaths.icSearch,
            width: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: List.generate(5, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DESIGN',
                    style: AssetStyles.h6.copyWith(
                        color: AppColors.getColor(ColorKey.primary60)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'What is design system? And why you need one',
                    style: AssetStyles.h2.copyWith(height: 1.2),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Having a design system in place is a simple solution to keep you and your team aligned. A design system is an agreement between you and the rest of the team. It’s a common language that helps you improve communication, efficiency, and decision-making.',
                maxLines: 4,
                style: AssetStyles.pSm,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(children: [
                Text(
                  'January 19',
                  style: AssetStyles.pXs
                      .copyWith(color: AppColors.getColor(ColorKey.grey60)),
                ),
                const Spacer(),
                PrimaryInkWell(
                  onTap: () {},
                  child: PrimaryAssetImage(
                    AssetPaths.icHeadphone,
                    width: 16,
                    height: 16,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                const SizedBox(width: 16),
                PrimaryInkWell(
                  onTap: () {},
                  child: PrimaryAssetImage(
                    AssetPaths.icBookmarkBold,
                    width: 16,
                    height: 16,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                const SizedBox(width: 16),
                PrimaryInkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: PrimaryAssetImage(
                      AssetPaths.icShare,
                      fit: BoxFit.scaleDown,
                      color: AppColors.getColor(ColorKey.grey100),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 30),
              const PrimaryDivider(),
              const SizedBox(height: 24),
            ],
          );
        }),
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
