import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Note2Page extends StatefulWidget {
  const Note2Page({super.key});

  @override
  State<Note2Page> createState() => _Note2PageState();
}

class _Note2PageState extends State<Note2Page> {
  final listItem = [
    BasicModel(name: "Design", value: false),
    BasicModel(name: "Project Plan", value: false),
    BasicModel(name: "Meeting", value: false),
    BasicModel(name: "Brainstorming", value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        hideLeading: true,
        titleWidget: Row(children: [
          PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: const PrimaryAssetImage(
              AssetPaths.icCheck,
              width: 16,
              color: AssetColors.green,
            ),
          ),
          const SizedBox(width: 20),
          PrimaryAssetImage(
            AssetPaths.icRefreshCcw,
            width: 15,
            color: AppColors.getColor(ColorKey.grey100),
          ),
          const SizedBox(width: 16),
          PrimaryAssetImage(
            AssetPaths.icRefreshCw,
            width: 15,
            color: AppColors.getColor(ColorKey.grey100),
          ),
          const Spacer(),
          PrimaryAssetImage(
            AssetPaths.icUserPlus,
            width: 16,
            color: AppColors.getColor(ColorKey.grey100),
          ),
          const SizedBox(width: 16),
          PrimaryAssetImage(
            AssetPaths.icMore,
            width: 16,
            color: AppColors.getColor(ColorKey.grey100),
          ),
        ]),
      ),
      bottomSheet: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          spacing: 8,
          children: listItem.map((e) {
            return PrimaryChip(
              text: e.name,
              height: 32,
              isActive: e.value,
              border: Border.all(color: AppColors.getColor(ColorKey.primary30)),
              backgroundColor: e.value ? null : Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () => setState(() => e.value = !e.value),
            );
          }).toList(),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            const PrimaryAssetImage(AssetPaths.icBook),
            const SizedBox(width: 8),
            Text(
              'Design',
              style: AssetStyles.pXs.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
          ]),
          TextFormField(
            initialValue: 'Meeting Notes',
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
            initialValue:
                'Is New York City unique in the country’s coronavirus fight — or is it just one of the first?',
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
      // bottomSheet: cons BottomNote(),
    );
  }
}
