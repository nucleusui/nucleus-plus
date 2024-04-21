import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Shop4Page extends StatefulWidget {
  const Shop4Page({super.key});

  @override
  State<Shop4Page> createState() => _Shop4PageState();
}

class _Shop4PageState extends State<Shop4Page> {
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
      appBar: PrimaryAppBar(leading: const SizedBox(), title: 'Shop', actions: [
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
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            children: [
              Row(children: [
                const Text('Shop by category', style: AssetStyles.h3),
                const Spacer(),
                Text(
                  'Show all',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 24,
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(8, (index) {
                  return Column(children: [
                    PrimaryAssetImage(
                      index == 0
                          ? AssetPaths.imgPlaceholder7
                          : index == 1
                              ? AssetPaths.imgPlaceholder2
                              : index == 2
                                  ? AssetPaths.imgPlaceholder1
                                  : index.isEven
                                      ? AssetPaths.imgPlaceholder8
                                      : AssetPaths.imgPlaceholder6,
                      width: 74,
                      height: 74,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    const SizedBox(height: 5),
                    const Text('Category', style: AssetStyles.pXs),
                  ]);
                }),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 16),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: [
                  const Text('Shop by category', style: AssetStyles.h3),
                  const Spacer(),
                  Text(
                    'Show all',
                    style: AssetStyles.pSm.copyWith(
                      color: AppColors.getColor(ColorKey.primary60),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 24,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      width: 124,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryAssetImage(
                            index == 0
                                ? AssetPaths.imgPlaceholder2
                                : index == 1
                                    ? AssetPaths.imgPlaceholder1
                                    : index == 2
                                        ? AssetPaths.imgPlaceholder7
                                        : index.isEven
                                            ? AssetPaths.imgPlaceholder4
                                            : AssetPaths.imgPlaceholder6,
                            width: 124,
                            height: 92,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '\$31.99 - \$49.99',
                            style: AssetStyles.h5,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Product title or description',
                            style: AssetStyles.pXs.copyWith(
                              color: AppColors.getColor(ColorKey.grey60),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          )
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
