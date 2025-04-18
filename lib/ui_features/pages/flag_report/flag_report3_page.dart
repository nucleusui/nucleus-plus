import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class FlagReport3Page extends StatefulWidget {
  const FlagReport3Page({super.key});

  @override
  State<FlagReport3Page> createState() => _FlagReport3PageState();
}

class _FlagReport3PageState extends State<FlagReport3Page> {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const SizedBox(height: 8),
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: const UniversalImage(AssetPaths.icClose),
            ),
            const Spacer(),
            const Text('Report', style: AssetStyles.h3),
            const Spacer(),
          ]),
          const SizedBox(height: 16),
          ...[
            'Fake profile / spam',
            'Inappropriate message',
            'Inappropriate bio',
            'Underage user'
          ].map((e) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(children: [
                  Text(e, style: AssetStyles.pMd),
                  const Spacer(),
                  UniversalImage(
                    AssetPaths.icArrowNext,
                    color: AppColors.getColor(ColorKey.grey100),
                  )
                ]),
              ),
              const PrimaryDivider(),
            ]);
          }),
          const SizedBox(height: 32),
        ]),
      ),
    );
  }
}
