import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class NewsFeed3Page extends StatefulWidget {
  const NewsFeed3Page({super.key});

  @override
  State<NewsFeed3Page> createState() => _NewsFeed3PageState();
}

class _NewsFeed3PageState extends State<NewsFeed3Page> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Designerdz', hideLeading: true, actions: [
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icSearch,
            width: 20,
            color: AppColors.getColor(ColorKey.grey100),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(shrinkWrap: true, children: [
        const SizedBox(height: 16),
        ...List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UniversalImage(
                  height: 207,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(16),
                  width: double.infinity,
                  index.isEven
                      ? AssetPaths.imgPlaceholder5
                      : AssetPaths.imgPlaceholder2,
                ),
                const SizedBox(height: 16),
                Text(
                  'DESIGN',
                  style: AssetStyles.h5
                      .copyWith(color: AppColors.getColor(ColorKey.primary60)),
                ),
                const SizedBox(height: 8),
                Text(
                  'What is design system? And why you need one',
                  style: AssetStyles.h2.copyWith(height: 1.2),
                ),
                const SizedBox(height: 10),
                Text(
                  'By Megan Marples',
                  style: AssetStyles.pSm
                      .copyWith(color: AppColors.getColor(ColorKey.grey60)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'If you ask designers what a design system is, you’ll probably get a lot of different answers. For one, Libraries and style guides can be used as design systems, so people often assume that they’re the same thing. ',
                  maxLines: 3,
                  style: AssetStyles.pSm,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        }),
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
