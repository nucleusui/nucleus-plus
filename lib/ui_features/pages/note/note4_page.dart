import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

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
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Show Bottom Sheet',
          buttonSize: ButtonSize.large,
          onPressed: () => showBottomSheet(context),
        ),
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
              Button.secondary(
                height: 32,
                width: 32,
                icon: UniversalImage(AssetPaths.icTag),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              Button.secondary(
                height: 32,
                width: 32,
                icon: UniversalImage(AssetPaths.icUserPlusBold),
                onPressed: () {},
              ),
              const Spacer(),
              Button.ghost(
                label: 'Save',
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 5),
            ]),
          )
        ]),
      ),
    );
  }
}
