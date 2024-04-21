import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Shop1Page extends StatefulWidget {
  const Shop1Page({super.key});

  @override
  State<Shop1Page> createState() => _Shop1PageState();
}

class _Shop1PageState extends State<Shop1Page> {
  int currentIndex = 2;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        leading: const SizedBox(),
        title: 'Shop',
        actions: [
          PrimaryInkWell(
            onTap: () {},
            child: PrimaryAssetImage(
              AssetPaths.icBookmark,
              height: 20,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(width: 16),
          PrimaryInkWell(
            onTap: () {},
            child: PrimaryAssetImage(
              AssetPaths.icSearch,
              width: 20,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          (
            menu: 'Shop by Collection',
            item: [
              (
                text: 'Accessories & Equipment',
                image: AssetPaths.imgPlaceholder2
              ),
              (
                text: 'Accessories & Equipment',
                image: AssetPaths.imgPlaceholder7
              ),
              (
                text: 'Accessories & Equipment',
                image: AssetPaths.imgPlaceholder5
              ),
            ]
          ),
          (
            menu: 'Upcoming',
            item: [
              (
                text: 'Accessories & Equipment',
                image: AssetPaths.imgPlaceholder1
              ),
              (
                text: 'Accessories & Equipment',
                image: AssetPaths.imgPlaceholder4
              ),
              (
                text: 'Accessories & Equipment',
                image: AssetPaths.imgPlaceholder5
              ),
            ]
          ),
        ].map((e) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 16),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(e.menu, style: AssetStyles.h2),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 16,
                  children: e.item.map((f) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryAssetImage(
                          f.image,
                          width: 217,
                          height: 217,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        Text(f.text, style: AssetStyles.h4),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
