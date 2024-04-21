import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';

class Note1Page extends StatelessWidget {
  const Note1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextField(
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
          TextField(
            style: AssetStyles.pMd.copyWith(height: 1.2),
            maxLines: null,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
        ],
      ),
    );
  }
}
