import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Note3Page extends StatelessWidget {
  const Note3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryButton(
          label: 'Save',
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.getColor(ColorKey.primary20),
          labelColor: AppColors.getColor(ColorKey.primary70),
          onTap: () {},
        ),
      ]),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextFormField(
            initialValue: 'UX Design Kick-off',
            style: AssetStyles.h1.copyWith(height: 1.2),
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: 'Untitled',
              hintStyle: AssetStyles.h1.copyWith(
                height: 1.2,
                color: AppColors.getColor(ColorKey.grey50),
              ),
              border: InputBorder.none,
            ),
          ),
          TextFormField(
            maxLines: null,
            style: AssetStyles.pMd,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            initialValue: 'Okay, so here’s the plan',
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: 'Start writing',
              hintStyle: AssetStyles.pMd
                  .copyWith(color: AppColors.getColor(ColorKey.grey50)),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.background),
          border: Border(
            top: BorderSide(
              color: AppColors.getColor(ColorKey.grey20),
              width: 0.5,
            ),
          ),
        ),
        child: Row(children: [
          IconButton(
            onPressed: () {},
            icon: PrimaryAssetImage(
              AssetPaths.icAlphabet,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: PrimaryAssetImage(
              AssetPaths.icAttachment,
              width: 15,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: PrimaryAssetImage(
              AssetPaths.icCheckSquare,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: PrimaryAssetImage(
              AssetPaths.icTrash,
              color: AppColors.getColor(ColorKey.grey50),
            ),
          )
        ]),
      ),
    );
  }
}
