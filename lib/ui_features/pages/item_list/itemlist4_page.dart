import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class ItemList4Page extends StatefulWidget {
  const ItemList4Page({super.key});

  @override
  State<ItemList4Page> createState() => _ItemList4PageState();
}

class _ItemList4PageState extends State<ItemList4Page> {
  int currentIndex = 1;
  final listItem = [
    BasicModel(name: "All", value: true),
    BasicModel(name: "Flutter", value: false),
    BasicModel(name: "Web", value: false),
    BasicModel(name: "Android", value: false),
    BasicModel(name: "iOS", value: false),
  ];
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Nucleus Components', actions: [
        PrimaryInkWell(
          onTap: () {},
          child: PrimaryAssetImage(
            AssetPaths.icBookmark,
            width: 18,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
      ]),
      body: ListView(shrinkWrap: true, children: [
        const SizedBox(height: 28),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            children: listItem.map((e) {
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
        const SizedBox(height: 16),
        ...List.generate(10, (index) {
          double rating = 0;
          return StatefulBuilder(builder: (context, setInnerState) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryAssetImage(
                    AssetPaths.imgPlaceholder2,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Component name', style: AssetStyles.h3),
                        Text(
                          'Building blocks for creating a user interface',
                          style: AssetStyles.pSm.copyWith(
                            color: AppColors.getColor(ColorKey.grey60),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(children: [
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 1,
                            itemCount: 5,
                            glowRadius: 0,
                            itemSize: 12,
                            allowHalfRating: false,
                            glowColor: Colors.amber,
                            direction: Axis.horizontal,
                            itemPadding: const EdgeInsets.only(right: 4),
                            itemBuilder: (context, index) => PrimaryAssetImage(
                              AssetPaths.icStarBold,
                              color: rating <= index
                                  ? null
                                  : AppColors.getColor(ColorKey.primary60),
                            ),
                            onRatingUpdate: (double value) =>
                                setInnerState(() => rating = value),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${(rating.toInt()) + 50}',
                            style: AssetStyles.pXs.copyWith(
                              color: AppColors.getColor(ColorKey.grey50),
                            ),
                          ),
                          const Spacer(),
                          PrimaryInkWell(
                            onTap: () {},
                            child: PrimaryAssetImage(
                              AssetPaths.icLove,
                              width: 12,
                              color: AppColors.getColor(ColorKey.grey50),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
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
