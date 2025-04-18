import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Search1Page extends StatefulWidget {
  const Search1Page({super.key});

  @override
  State<Search1Page> createState() => _Search1PageState();
}

class _Search1PageState extends State<Search1Page> {
  final searchController = TextEditingController();
  List searchResult = [];
  final listItem = [
    (
      title: 'Badge',
      description: '120 variants',
      image: AssetPaths.imgPlaceholder3,
    ),
    (
      title: 'Top Bar',
      description: '5 variants',
      image: AssetPaths.imgPlaceholder2,
    ),
    (
      title: 'Tab Bar',
      description: '12 variants',
      image: AssetPaths.imgPlaceholder1,
    ),
    (
      title: 'Search Bar',
      description: '5 variants',
      image: AssetPaths.imgPlaceholder7,
    ),
    (
      title: 'Buttons',
      description: '120 variants',
      image: AssetPaths.imgPlaceholder8,
    ),
    (
      title: 'Primary Buttons',
      description: '5 variants',
      image: AssetPaths.imgPlaceholder2,
    ),
    (
      title: 'Secondary Buttons',
      description: '12 variants',
      image: AssetPaths.imgPlaceholder3,
    ),
    (
      title: 'Tertiary Buttons',
      description: '5 variants',
      image: AssetPaths.imgPlaceholder4,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 8),
        PrimaryAppBar(
          hideLeading: true,
          heightAppBar: 64,
          titleWidget: Row(children: [
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: UniversalImage(
                  AssetPaths.icArrowBack,
                  width: 8,
                  height: 16,
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFields(
                height: 48,
                autofocus: true,
                hintText: 'Search',
                controller: searchController,
                suffixIcon: Visibility(
                  visible: searchController.text.isNotEmpty,
                  child: PrimaryInkWell(
                    onTap: () {
                      searchController.clear();
                      setState(() {});
                    },
                    child: UniversalImage(
                      AssetPaths.icClose,
                      width: 12,
                      height: 12,
                      color: AppColors.getColor(ColorKey.grey60),
                    ),
                  ),
                ),
                onChanged: (value) => setState(() => searchResult = listItem
                    .where((e) =>
                        e.title.toLowerCase().contains(value.toLowerCase()))
                    .toList()),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            children: [
              ...(searchController.text.isEmpty ? listItem : searchResult)
                  .map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(children: [
                    UniversalImage(
                      e.image,
                      height: 64,
                      width: 64,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: AssetStyles.h3.copyWith(
                            color: AppColors.getColor(ColorKey.grey100),
                          ),
                        ),
                        Text(e.description, style: AssetStyles.pSm),
                      ],
                    )
                  ]),
                );
              }),
            ],
          ),
        ),
      ]),
    );
  }
}
