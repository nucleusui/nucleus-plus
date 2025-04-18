import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class ActionOption3Page extends StatefulWidget {
  const ActionOption3Page({super.key});

  @override
  State<ActionOption3Page> createState() => _ActionOption3PageState();
}

class _ActionOption3PageState extends State<ActionOption3Page> {
  final listItem = [
    [
      (icon: AssetPaths.icLove, title: 'Liked', onTap: () {}),
      (icon: AssetPaths.icShare, title: 'Share', onTap: () {}),
      (icon: AssetPaths.icDownload, title: 'Download', onTap: () {})
    ],
    [
      (icon: AssetPaths.icList, title: 'Add to offline playlist', onTap: () {}),
      (icon: AssetPaths.icClockBold, title: 'Watch later', onTap: () {}),
    ],
    [
      (icon: AssetPaths.icWarning, title: 'Report video', onTap: () {}),
    ]
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
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(children: [
            UniversalImage(
              AssetPaths.imgPlaceholder3,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(16),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Component name', style: AssetStyles.h3),
                    Text(
                      'Building blocks for creating a user\ninterface',
                      style: AssetStyles.pSm.copyWith(
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
        const PrimaryDivider(),
        ...listItem.map((e) {
          return Column(children: [
            ...e.map((f) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: PrimaryInkWell(
                  onTap: f.onTap,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: UniversalImage(
                        f.icon,
                        width: 16,
                        fit: BoxFit.scaleDown,
                        color: AppColors.getColor(ColorKey.grey100),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(f.title, style: AssetStyles.pMd),
                  ]),
                ),
              );
            }),
            const SizedBox(height: 16),
            const PrimaryDivider(),
          ]);
        }),
      ]),
    );
  }
}
