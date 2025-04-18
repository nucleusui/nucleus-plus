import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Article5Page extends StatefulWidget {
  const Article5Page({super.key});

  @override
  State<Article5Page> createState() => _Article5PageState();
}

class _Article5PageState extends State<Article5Page> {
  int currentIndex = 3;
  int slideIndex = 0;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryInkWell(
          onTap: () {},
          child: const UniversalImage(AssetPaths.icBookmark, width: 16),
        ),
        const SizedBox(width: 20),
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icMore,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Wrap(
            spacing: 5,
            children: List.generate(3, (index) {
              return UniversalImage(
                AssetPaths.icCircleFill,
                width: 8,
                height: 8,
                color: index == slideIndex
                    ? AppColors.getColor(ColorKey.primary60)
                    : AppColors.getColor(ColorKey.grey20),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Text(
            'The case for an open design system',
            style: AssetStyles.h2,
          ),
          const SizedBox(height: 12),
          Text(
            'Published on Sep 2, 2021',
            textAlign: TextAlign.left,
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey50)),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) => setState(() => slideIndex = value),
              itemBuilder: (_, __) => UniversalImage(
                AssetPaths.imgPlaceholder5,
                height: 180,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(children: [
            const UniversalImage(
              AssetPaths.imgUser1,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('James Ryan', style: AssetStyles.h5),
              Text(
                'Product Design',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
            ]),
            const Spacer(),
            Button.primary(
              label: 'Follow',
              buttonSize: ButtonSize.medium,
              onPressed: () {},
            ),
          ]),
          const SizedBox(height: 12),
          const Text(
            'Switching tools isn’t a decision to be taken lightly. Here’s a nuts-and-bolts and behind-the-scenes look at how.',
            style: AssetStyles.pSm,
          ),
          const SizedBox(height: 16),
          const PrimaryDivider(),
          const SizedBox(height: 16),
          Row(children: [
            Stack(
              children: [
                AssetPaths.imgUser7,
                AssetPaths.imgUser6,
                AssetPaths.imgUser3,
                AssetPaths.imgUser2,
              ].asMap().entries.map((e) {
                return Padding(
                  padding: EdgeInsets.only(left: e.key * 16),
                  child: UniversalImage(
                    e.value,
                    width: 32,
                    height: 32,
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Text(
              '238 Comments',
              style: AssetStyles.pMd.copyWith(
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ),
          ]),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
