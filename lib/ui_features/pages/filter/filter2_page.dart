import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class Filter2Page extends StatefulWidget {
  const Filter2Page({super.key});

  @override
  State<Filter2Page> createState() => _Filter2PageState();
}

class _Filter2PageState extends State<Filter2Page> {
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
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(children: [
              PrimaryInkWell(
                onTap: () => Navigator.pop(context),
                child: const PrimaryAssetImage(
                  AssetPaths.icClose,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              const Text('Filters', style: AssetStyles.h3),
              const Spacer(),
              const SizedBox(width: 16),
            ]),
            const SizedBox(height: 16),
            ...[
              (title: 'Occasion', value: 'Valentine’s Day'),
              (title: 'Photo', value: 'No Photos'),
              (title: 'Recipent', value: 'Girlfriend'),
              (title: 'Label', value: ''),
              (title: 'Label', value: ''),
              (title: 'Label', value: ''),
            ].map((e) {
              return Column(children: [
                const SizedBox(height: 24),
                PrimaryInkWell(
                  onTap: () {},
                  child: Row(children: [
                    Text(e.title, style: AssetStyles.pMd),
                    const Spacer(),
                    if (e.value.isEmpty)
                      PrimaryAssetImage(
                        AssetPaths.icArrowNext,
                        fit: BoxFit.cover,
                        width: 12,
                        height: 12,
                        color: AppColors.getColor(ColorKey.grey60),
                      )
                    else
                      Row(children: [
                        Text(
                          e.value,
                          style: AssetStyles.h4.copyWith(
                            color: AppColors.getColor(ColorKey.primary60),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Stack(alignment: Alignment.center, children: [
                          const PrimaryAssetImage(AssetPaths.icClearCircle),
                          Icon(
                            Icons.clear,
                            size: 12,
                            color: AppColors.getColor(ColorKey.grey60),
                          ),
                        ])
                      ]),
                    const SizedBox(width: 8),
                  ]),
                ),
                const SizedBox(height: 24),
                const PrimaryDivider(),
              ]);
            }),
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                onTap: () {},
                label: 'Show 785 results',
              ),
            ),
          ]),
        );
      }),
    );
  }
}
