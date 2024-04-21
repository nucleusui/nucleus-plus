import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Shop3Page extends StatefulWidget {
  const Shop3Page({super.key});

  @override
  State<Shop3Page> createState() => _Shop3PageState();
}

class _Shop3PageState extends State<Shop3Page> {
  int currentIndex = 2;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];

  final listFilter = [
    BasicModel(name: "Stationery", value: true),
    BasicModel(name: "Accessories", value: false),
    BasicModel(name: "Office", value: false),
    BasicModel(name: "Other", value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(hideLeading: true, actions: [
        PrimaryInkWell(
          onTap: () {},
          child: PrimaryAssetImage(
            AssetPaths.icSearch,
            width: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
      ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            children: listFilter.map((e) {
              return PrimaryChip(
                text: e.name,
                isActive: e.value,
                height: 32,
                backgroundColor: e.value ? null : Colors.transparent,
                border: e.value
                    ? null
                    : Border.all(
                        color: AppColors.getColor(ColorKey.primary30),
                      ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onTap: () => setState(() => e.value = !e.value),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 24,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: (screenWidth(context) / 2) - 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryAssetImage(
                        index == 0
                            ? AssetPaths.imgPlaceholder7
                            : index == 1
                                ? AssetPaths.imgPlaceholder1
                                : index == 2
                                    ? AssetPaths.imgPlaceholder2
                                    : index.isEven
                                        ? AssetPaths.imgPlaceholder4
                                        : AssetPaths.imgPlaceholder6,
                        fit: BoxFit.cover,
                        height: (screenWidth(context) / 2) - 24,
                        width: (screenWidth(context) / 2) - 24,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('Brand', style: AssetStyles.h4),
                          const Spacer(),
                          PrimaryAssetImage(
                            AssetPaths.icLove,
                            color: AppColors.getColor(ColorKey.grey60),
                          ),
                        ],
                      ),
                      Text(
                        'Category',
                        style: AssetStyles.pXs.copyWith(
                          color: AppColors.getColor(ColorKey.grey60),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('US\$31.74', style: AssetStyles.h5),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
