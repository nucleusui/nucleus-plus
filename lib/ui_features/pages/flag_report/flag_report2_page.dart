import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class FlagReport2Page extends StatefulWidget {
  const FlagReport2Page({super.key});

  @override
  State<FlagReport2Page> createState() => _FlagReport2PageState();
}

class _FlagReport2PageState extends State<FlagReport2Page> {
  final listItem = [
    BasicModel(
      name: "Spam or suspicious content",
      icon: AssetPaths.icEye,
      value: false,
    ),
    BasicModel(
      name: "Abusive or threatening",
      icon: AssetPaths.icWarning,
      value: false,
    ),
    BasicModel(
      name: "Hate speech",
      icon: AssetPaths.icChatReport,
      value: false,
    ),
    BasicModel(
      name: "Inappropriate",
      icon: AssetPaths.icDislike,
      value: false,
    ),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'What’s wrong?',
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'Help us improve our service.',
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 24),
          StatefulBuilder(builder: (context, setInnerState) {
            return Column(children: [
              ...listItem.map((e) {
                return PrimaryInkWell(
                  onTap: () => setInnerState(() => e.value = !e.value),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.getColor(ColorKey.grey10),
                    ),
                    child: Row(children: [
                      UniversalImage(
                        e.icon!,
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                      const Spacer(),
                      Text(e.name),
                      const Spacer(),
                      const SizedBox(width: 16),
                    ]),
                  ),
                );
              })
            ]);
          }),
          const SizedBox(height: 16),
          Button.primary(
            label: 'Report',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
          Button.secondary(
            label: 'Cancel',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(height: screenHeight(context) / 4),
        ]),
      ),
    );
  }
}
