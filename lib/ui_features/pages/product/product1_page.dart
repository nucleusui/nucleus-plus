import 'package:flutter/material.dart';
import 'package:nucles_app/config/asset_colors.dart';
import 'package:nucles_app/config/asset_paths.dart';
import 'package:nucles_app/config/asset_styles.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Product1Page extends StatefulWidget {
  const Product1Page({super.key});

  @override
  State<Product1Page> createState() => _Product1PageState();
}

class _Product1PageState extends State<Product1Page> {
  int currentIndex = 0;
  BasicModel? selectedColor;
  List<BasicModel> listItems = [
    BasicModel(
      name: 'Black',
      value: false,
      color: AppColors.getColor(ColorKey.grey100),
    ),
    BasicModel(name: 'Blue', value: false, color: AssetColors.blue),
    BasicModel(name: 'Orange', value: false, color: AssetColors.orange),
  ];

  @override
  void initState() {
    selectedColor = listItems.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          PrimaryInkWell(
            onTap: () {},
            child: const PrimaryAssetImage(AssetPaths.icShare, width: 18),
          ),
          const SizedBox(width: 20),
          PrimaryInkWell(
            onTap: () {},
            child: const PrimaryAssetImage(AssetPaths.icBag, width: 20),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: ListView(shrinkWrap: true, children: [
        SizedBox(
          height: 393,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) => setState(() => currentIndex = value),
                itemBuilder: (_, __) => const PrimaryAssetImage(
                  AssetPaths.imgPlaceholder2,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Wrap(
                  spacing: 5,
                  alignment: WrapAlignment.center,
                  children: List.generate(5, (index) {
                    return PrimaryAssetImage(
                      AssetPaths.icCircleFill,
                      width: 8,
                      color: index == currentIndex
                          ? Colors.white
                          : Colors.grey.shade700,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Text('Product Name', style: AssetStyles.h2),
            const SizedBox(height: 4),
            Text(
              '9500 Gilman La Jolla, CA',
              style: AssetStyles.pSm.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            const SizedBox(height: 12),
            const Text('\$3,200', style: AssetStyles.h4),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: PrimaryDivider(),
            ),
            Text.rich(
              TextSpan(
                text: 'Color: ',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
                children: [
                  TextSpan(
                    text: selectedColor?.name,
                    style: AssetStyles.h4.copyWith(color: selectedColor?.color),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: listItems.map((e) {
                final selected = selectedColor == e;
                return PrimaryInkWell(
                  onTap: () => setState(() => selectedColor = e),
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(1),
                    decoration: !selected
                        ? null
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 0.5),
                          ),
                    child: PrimaryAssetImage(
                      AssetPaths.icCircleFill,
                      width: 20,
                      color: e.color,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          onTap: () {},
          label: 'Add to Cart',
        ),
      ),
    );
  }
}
