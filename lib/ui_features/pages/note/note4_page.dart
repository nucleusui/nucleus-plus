import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/icon_rounded_button.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class Note4Page extends StatefulWidget {
  const Note4Page({super.key});

  @override
  State<Note4Page> createState() => _Note4PageState();
}

class _Note4PageState extends State<Note4Page> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            label: 'Show Bottom Sheet',
            onTap: () => showBottomSheet(context),
          ),
        ]),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight(context) / 2),
            child: Column(children: [
              TextField(
                style: AssetStyles.h2.copyWith(height: 1.2),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: AssetStyles.h2.copyWith(
                    height: 1.2,
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                style: AssetStyles.pMd.copyWith(height: 1.2),
                maxLines: null,
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: 'Start writing',
                  hintStyle: AssetStyles.pMd.copyWith(
                    height: 1.2,
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ]),
          ),
          Container(
            height: 56,
            margin: const EdgeInsets.only(top: 24),
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
              IconRoundedButton(
                width: 32,
                height: 32,
                icon: AssetPaths.icTag,
                borderColor: Colors.transparent,
                iconColor: AppColors.getColor(ColorKey.primary70),
                color: AppColors.getColor(ColorKey.primary20),
                onTap: () {},
              ),
              const SizedBox(width: 16),
              IconRoundedButton(
                width: 32,
                height: 32,
                icon: AssetPaths.icUserPlusBold,
                borderColor: Colors.transparent,
                iconColor: AppColors.getColor(ColorKey.primary70),
                color: AppColors.getColor(ColorKey.primary20),
                onTap: () {},
              ),
              const Spacer(),
              Text(
                'Save',
                style: AssetStyles.h4.copyWith(
                  color: AppColors.getColor(ColorKey.primary70),
                ),
              ),
              const SizedBox(width: 5),
            ]),
          )
        ]),
      ),
    );
  }
}
