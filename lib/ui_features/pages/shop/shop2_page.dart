import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Shop2Page extends StatefulWidget {
  const Shop2Page({super.key});

  @override
  State<Shop2Page> createState() => _Shop2PageState();
}

class _Shop2PageState extends State<Shop2Page> {
  int currentIndex = 2;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];

  final listFilter = [
    BasicModel(name: "Sale", value: true),
    BasicModel(name: "New", value: false),
    BasicModel(name: "Clothing", value: false),
    BasicModel(name: "Accessories", value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Shop', hideLeading: true, actions: [
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icSearch,
            width: 20,
            height: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: InputField(
            hintText: 'Search',
            fillColor: AppColors.getColor(ColorKey.grey10),
            borderRadius: BorderRadius.circular(100),
            prefixIcon: UniversalImage(
              AssetPaths.icSearch,
              width: 18,
              height: 18,
              color: AppColors.getColor(ColorKey.grey60),
            ),
          ),
        ),
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
                      Stack(alignment: Alignment.topRight, children: [
                        UniversalImage(
                          index == 0
                              ? AssetPaths.imgPlaceholder2
                              : index == 1
                                  ? AssetPaths.imgPlaceholder1
                                  : index == 2
                                      ? AssetPaths.imgPlaceholder3
                                      : index.isOdd
                                          ? AssetPaths.imgPlaceholder7
                                          : AssetPaths.imgPlaceholder6,
                          height: 300,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: UniversalImage(
                            AssetPaths.icLove,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      const Text('Brand', style: AssetStyles.h4),
                      const Text('Product Name', style: AssetStyles.pXs),
                      const SizedBox(height: 4),
                      const Text('US\$176', style: AssetStyles.h5),
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
