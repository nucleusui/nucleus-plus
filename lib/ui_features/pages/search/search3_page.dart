import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';

class Search3Page extends StatefulWidget {
  const Search3Page({super.key});

  @override
  State<Search3Page> createState() => _Search3PageState();
}

class _Search3PageState extends State<Search3Page> {
  final searchController = TextEditingController();
  List searchResult = [];
  final listItem = ['Badges', 'Buttons', 'Bars', 'Chips', 'Dividers', 'List'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryTextField(
                  height: 48,
                  hintText: 'Search',
                  autofocus: true,
                  controller: searchController,
                  contentPadding: const EdgeInsets.only(top: 8),
                  fillColor: AppColors.getColor(ColorKey.grey10),
                  borderRadius: BorderRadius.circular(100),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 8, 10),
                    child: UniversalImage(
                      AssetPaths.icSearch,
                      width: 16,
                      height: 16,
                      color: AppColors.getColor(ColorKey.grey60),
                    ),
                  ),
                  onChanged: (val) => setState(() => searchResult = listItem
                      .where((e) => e.toLowerCase().contains(val.toLowerCase()))
                      .toList()),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Search results',
              style: AssetStyles.pMd.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const PrimaryDivider(),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                ...(searchController.text.isEmpty ? listItem : searchResult)
                    .map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Row(children: [
                      Text(e, style: AssetStyles.pMd),
                      const Spacer(),
                      UniversalImage(
                        AssetPaths.icArrowNext,
                        width: 14,
                        height: 14,
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ]),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
