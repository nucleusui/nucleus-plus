import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class ItemList5Page extends StatefulWidget {
  const ItemList5Page({super.key});

  @override
  State<ItemList5Page> createState() => _ItemList5PageState();
}

class _ItemList5PageState extends State<ItemList5Page> {
  int currentIndex = 1;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Nucleus UI'),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: List.generate(5, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryAssetImage(
                index.isEven
                    ? AssetPaths.imgPlaceholder5
                    : AssetPaths.imgPlaceholder2,
                height: 200,
                fit: BoxFit.cover,
                width: screenWidth(context),
                borderRadius: BorderRadius.circular(16),
              ),
              const SizedBox(height: 12),
              const Text('Component name', style: AssetStyles.h3),
              const SizedBox(height: 4),
              Text(
                'Components are interactive building blocks for creating a user interface.',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
              const SizedBox(height: 8),
              Row(children: [
                PrimaryAssetImage(
                  AssetPaths.icCircle,
                  width: 16,
                  color: AppColors.getColor(ColorKey.primary60),
                ),
                const SizedBox(width: 8),
                Text(
                  '8 variants',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
              ]),
              const SizedBox(height: 24),
            ],
          );
        }),
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
