import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class SearchEmptyPage extends StatefulWidget {
  const SearchEmptyPage({super.key});

  @override
  State<SearchEmptyPage> createState() => _SearchEmptyPageState();
}

class _SearchEmptyPageState extends State<SearchEmptyPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        elevation: 0.35,
        backgroundColor: AppColors.getColor(ColorKey.background),
        shadowColor: AppColors.getColor(ColorKey.grey50),
        centerTitle: false,
        useActionPadding: false,
        titleWidget: TextField(
          controller: searchController,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onChanged: (value) => setState(() {}),
          decoration: const InputDecoration(
            hintText: 'Search',
            isDense: true,
            isCollapsed: true,
            hintStyle: AssetStyles.pMd,
            contentPadding: EdgeInsets.only(bottom: 8),
            border: InputBorder.none,
          ),
        ),
        leading: IconButton(
          splashRadius: 20,
          onPressed: () => Navigator.pop(context),
          icon: const PrimaryAssetImage(AssetPaths.icArrowBack, width: 9),
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              searchController.clear();
              setState(() {});
            },
            icon: PrimaryAssetImage(
              AssetPaths.icClose,
              width: 12,
              color: AppColors.getColor(ColorKey.grey60),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(children: [
          const Spacer(),
          const Text('Nothing were found', style: AssetStyles.h2),
          const SizedBox(height: 16),
          Text(
            'We couldn’t find anything for "${searchController.text.isEmpty ? 'Colorado' : searchController.text}"\nTry a different search.',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
