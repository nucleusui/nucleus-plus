import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Note5Page extends StatefulWidget {
  const Note5Page({super.key});

  @override
  State<Note5Page> createState() => _Note5PageState();
}

class _Note5PageState extends State<Note5Page> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryInkWell(
          onTap: () {},
          child: Text(
            'Done',
            style: AssetStyles.h3.copyWith(
              color: AppColors.getColor(ColorKey.primary70),
            ),
          ),
        ),
      ]),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          PrimaryButton(
            height: 32,
            width: 132,
            label: 'Add Tags',
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.getColor(ColorKey.primary20),
            labelColor: AppColors.getColor(ColorKey.primary70),
            prefixIcon: PrimaryAssetImage(
              AssetPaths.icTag,
              color: AppColors.getColor(ColorKey.primary70),
            ),
            onTap: () {},
          ),
          const Spacer(),
          Text(
            '${textController.text.length}/8000',
            style: AssetStyles.pSm.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
        ]),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            style: AssetStyles.h2.copyWith(height: 1.2),
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: 'Tell us about your project',
              hintStyle: AssetStyles.h2.copyWith(
                height: 1.2,
                color: AppColors.getColor(ColorKey.grey50),
              ),
              border: InputBorder.none,
            ),
          ),
          TextFormField(
            maxLines: null,
            style: AssetStyles.pMd,
            controller: textController,
            onChanged: (_) => setState(() {}),
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
    );
  }
}
