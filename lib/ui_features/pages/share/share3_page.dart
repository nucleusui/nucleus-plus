import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Share3Page extends StatefulWidget {
  const Share3Page({super.key});

  @override
  State<Share3Page> createState() => _Share3PageState();
}

class _Share3PageState extends State<Share3Page> {
  final listItem = [
    (icon: AssetPaths.icBookmarkBold, title: 'Bookmark', type: 'basic'),
    (icon: AssetPaths.icLink, title: 'Copy link', type: 'basic'),
    (icon: AssetPaths.icShare, title: 'Share', type: 'basic'),
    (icon: AssetPaths.icMore, title: 'More', type: 'more'),
    (icon: AssetPaths.logoFacebook, title: 'Facebook', type: 'brand'),
    (icon: AssetPaths.logoGoogle, title: 'Gmail', type: 'brand'),
    (icon: AssetPaths.logoTwitter, title: 'Twitter', type: 'brand'),
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
          onPressed: () => showBottomSheet(context),
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
        child: Column(children: [
          const Text('Send to', style: AssetStyles.h2),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: listItem.map((e) {
              return SizedBox(
                width: 76,
                child: Column(
                  children: [
                    Button.primary(
                      icon: UniversalImage(
                        e.icon,
                        color: e.type == 'basic'
                            ? Colors.white
                            : e.type == 'more'
                                ? AppColors.getColor(ColorKey.primary20)
                                : null,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 8),
                    Text(
                      e.title,
                      style: AssetStyles.pSm.copyWith(
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          Button.ghost(
            label: 'Cancel',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
