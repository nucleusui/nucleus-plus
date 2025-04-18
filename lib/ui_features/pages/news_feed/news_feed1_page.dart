import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class NewsFeed1Page extends StatefulWidget {
  const NewsFeed1Page({super.key});

  @override
  State<NewsFeed1Page> createState() => _NewsFeed1PageState();
}

class _NewsFeed1PageState extends State<NewsFeed1Page> {
  int currentIndex = 0;
  final List<NavbarModel> navbars = [
    NavbarModel(icon: AssetPaths.icHome, activeIcon: AssetPaths.icHomeFill),
    NavbarModel(icon: AssetPaths.icSearch),
    NavbarModel(icon: AssetPaths.icBookmarkBold),
    NavbarModel(icon: AssetPaths.icUserBold),
  ];

  final listFilter = [
    BasicModel(name: "Today", value: true),
    BasicModel(name: "Local", value: false),
    BasicModel(name: "Politics", value: false),
    BasicModel(name: "Tech", value: false),
    BasicModel(name: "Science", value: false),
  ];

  final listItem = [
    (
      image: AssetPaths.imgPlaceholder3,
      title: 'Build a design system with an\nenterprise scale',
      author: '1h ago · by Isabella Kwai',
    ),
    (
      image: AssetPaths.imgPlaceholder8,
      title: 'The Case for an open design system',
      author: '3h ago · by Tracey Trully',
    ),
    (
      image: AssetPaths.imgPlaceholder7,
      title: 'The Myth of the Rockstar Designer',
      author: '3h ago · by Tracey Trully',
    ),
    (
      image: AssetPaths.imgPlaceholder6,
      title: 'Articulate design specification in Design System',
      author: '3h ago · by Tracey Trully',
    ),
    (
      image: AssetPaths.imgPlaceholder1,
      title: 'The Myth of the Rockstar Designer',
      author: '3h ago · by Tracey Trully',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'News'),
      body: ListView(shrinkWrap: true, children: [
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 12,
            children: listFilter.map((e) {
              return PrimaryChip(
                height: 32,
                text: e.name,
                isActive: e.value,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () => setState(() => e.value = !e.value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            UniversalImage(
              height: 207,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(16),
              width: double.infinity,
              AssetPaths.imgPlaceholder2,
            ),
            const SizedBox(height: 16),
            Text(
              'White-labeling: Putting the design system in users\' hands',
              style: AssetStyles.h3.copyWith(height: 1.3),
            ),
            const SizedBox(height: 5),
            Text(
              '1h ago · by Troy Corlson',
              style: AssetStyles.pSm
                  .copyWith(color: AppColors.getColor(ColorKey.grey60)),
            ),
            const SizedBox(height: 24),
            ...listItem.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PrimaryInkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UniversalImage(
                        e.image,
                        height: 64,
                        width: 64,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title,
                              style: AssetStyles.h5.copyWith(
                                color: AppColors.getColor(ColorKey.grey100),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              e.author,
                              style: AssetStyles.pXs.copyWith(
                                color: AppColors.getColor(ColorKey.grey60),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ]),
        )
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
