import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Share2Page extends StatefulWidget {
  const Share2Page({super.key});

  @override
  State<Share2Page> createState() => _Share2PageState();
}

class _Share2PageState extends State<Share2Page> {
  final listItem = [
    (icon: AssetPaths.icBookmarkBold, title: 'Bookmark'),
    (icon: AssetPaths.icLink, title: 'Copy link'),
    (icon: AssetPaths.icShare2, title: 'Share'),
    (icon: AssetPaths.icEmail, title: 'Email'),
    (icon: AssetPaths.icMore, title: 'More')
  ];

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
          onTap: () => showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Share', style: AssetStyles.h2),
          const SizedBox(height: 16),
          ...listItem.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(children: [
                UniversalImage(
                  e.icon,
                  width: 16,
                  color: AppColors.getColor(ColorKey.grey100),
                ),
                const SizedBox(width: 20),
                Text(e.title, style: AssetStyles.pMd),
                const Spacer(),
                UniversalImage(
                  AssetPaths.icArrowNext,
                  color: AppColors.getColor(ColorKey.grey50),
                )
              ]),
            );
          }),
          const SizedBox(height: 32),
        ]),
      ),
    );
  }
}
