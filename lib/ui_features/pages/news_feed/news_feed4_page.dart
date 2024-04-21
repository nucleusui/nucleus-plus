import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class NewsFeed4Page extends StatefulWidget {
  const NewsFeed4Page({super.key});

  @override
  State<NewsFeed4Page> createState() => _NewsFeed4PageState();
}

class _NewsFeed4PageState extends State<NewsFeed4Page> {
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
      appBar: PrimaryAppBar(actions: [
        PrimaryInkWell(
          onTap: () {},
          child: const PrimaryAssetImage(
            AssetPaths.imgUser1,
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Text('Breaking News', style: AssetStyles.h1),
          const SizedBox(height: 2),
          Text(
            'Top 5 stories at the moment',
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey60),
            ),
          ),
          const SizedBox(height: 32),
          ...List.generate(5, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What is design system? And why you need one',
                          style: AssetStyles.h4.copyWith(height: 1.2),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Wired',
                          style: AssetStyles.h5.copyWith(
                              color: AppColors.getColor(ColorKey.grey60)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  PrimaryAssetImage(
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(16),
                    index == 2
                        ? AssetPaths.imgPlaceholder1
                        : index.isOdd
                            ? AssetPaths.imgPlaceholder5
                            : AssetPaths.imgPlaceholder2,
                  ),
                ]),
                const SizedBox(height: 12),
                const Text(
                  'While many understand the benefits of a design system—creating a structure built for scalability—some worry that they’ll lose flexibility.',
                  maxLines: 3,
                  style: AssetStyles.pSm,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(children: [
                  Text(
                    'Headlines - 5 hours ago',
                    style: AssetStyles.pSm
                        .copyWith(color: AppColors.getColor(ColorKey.grey60)),
                  ),
                  const Spacer(),
                  PrimaryInkWell(
                    onTap: () {},
                    child: PrimaryAssetImage(
                      AssetPaths.icBookmark,
                      width: 16,
                      height: 16,
                      color: AppColors.getColor(ColorKey.grey60),
                    ),
                  ),
                  const SizedBox(width: 16),
                  PrimaryInkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: PrimaryAssetImage(
                        AssetPaths.icMore,
                        fit: BoxFit.scaleDown,
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                const PrimaryDivider(),
                const SizedBox(height: 24),
              ],
            );
          }),
        ],
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
