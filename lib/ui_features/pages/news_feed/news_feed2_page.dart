import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class NewsFeed2Page extends StatefulWidget {
  const NewsFeed2Page({super.key});

  @override
  State<NewsFeed2Page> createState() => _NewsFeed2PageState();
}

class _NewsFeed2PageState extends State<NewsFeed2Page> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: 'News Feed',
          leading: PrimaryInkWell(
            onTap: () {},
            child: PrimaryAssetImage(
              AssetPaths.icMenu,
              fit: BoxFit.scaleDown,
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
          actions: [
            PrimaryInkWell(
              onTap: () {},
              child: PrimaryAssetImage(
                AssetPaths.icSearch,
                width: 20,
                color: AppColors.getColor(ColorKey.grey100),
              ),
            ),
            const SizedBox(width: 16),
            PrimaryInkWell(
              onTap: () {},
              child: PrimaryAssetImage(
                AssetPaths.icSetting,
                width: 20,
                color: AppColors.getColor(ColorKey.grey100),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: Column(children: [
          TabBar(
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: AppColors.getColor(ColorKey.grey20),
            labelColor: AppColors.getColor(ColorKey.primary60),
            unselectedLabelColor: AppColors.getColor(ColorKey.grey50),
            labelStyle: AssetStyles.h4.copyWith(fontFamily: 'PlusJakartaSans'),
            tabs: ['Headlines', 'Design', 'UX'].asMap().entries.map((e) {
              return Text(e.value);
            }).toList(),
          ),
          const Expanded(
            child: TabBarView(children: [
              _HeadlineWidget(),
              Center(child: Text('Design Tab', style: AssetStyles.pMd)),
              Center(child: Text('UX Tab', style: AssetStyles.pMd)),
            ]),
          ),
        ]),
        bottomNavigationBar: PrimaryNavbar(
          index: currentIndex,
          data: navbars,
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}

class _HeadlineWidget extends StatelessWidget {
  const _HeadlineWidget();

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            (
              title: 'Design Principles: why a design works',
              time: '3h',
            ),
            (
              title: 'Choosing the right mindset to design',
              time: '7h',
            ),
            (
              title:
                  'How to govern a design system that is continuously evolving',
              time: '13h',
            ),
          ].map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  e.title,
                  style: AssetStyles.h4.copyWith(height: 1.2),
                ),
                const SizedBox(height: 5),
                Text(
                  e.time,
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                ),
                const SizedBox(height: 16),
                const PrimaryDivider()
              ],
            );
          }).toList(),
        ),
      ),
      const SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: List.generate(3, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryAssetImage(
                  index.isEven
                      ? AssetPaths.imgPlaceholder1
                      : AssetPaths.imgPlaceholder2,
                  height: 197,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(17),
                ),
                const SizedBox(height: 16),
                const Text(
                  "White-labeling: Putting the design system in users' hands",
                  style: AssetStyles.h4,
                ),
                const SizedBox(height: 8),
                Row(children: [
                  Text(
                    "Yesterday",
                    style: AssetStyles.pSm.copyWith(
                      color: AppColors.getColor(ColorKey.grey50),
                    ),
                  ),
                  const Spacer(),
                  PrimaryAssetImage(
                    AssetPaths.icChat,
                    width: 16,
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                  const SizedBox(width: 4),
                  const Text("80", style: AssetStyles.pSm),
                ]),
                const SizedBox(height: 16),
                const PrimaryDivider()
              ],
            );
          }),
        ),
      ),
      // const CardNewsFeedSecond(
      //   title: 'White',
      //   time: 'Update yesterday',
      //   totalComment: '80',
      //   comment: true,
      // ),
    ]);
  }
}
