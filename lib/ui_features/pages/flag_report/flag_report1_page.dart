import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class FlagReport1Page extends StatefulWidget {
  const FlagReport1Page({super.key});

  @override
  State<FlagReport1Page> createState() => _FlagReport1PageState();
}

class _FlagReport1PageState extends State<FlagReport1Page> {
  final listItem = [
    BasicModel(name: "It’s a spam", value: false),
    BasicModel(name: "Not appropriate", value: false),
    BasicModel(name: "Intellectual property infringement", value: false),
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
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 8),
          PrimaryInkWell(
            onTap: () => Navigator.pop(context),
            child: const PrimaryAssetImage(
              AssetPaths.icClose,
              width: 18,
              height: 18,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Why are you reporting this case?',
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'No worries, your information will be completely private. We won’t share any information with the others.',
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 32),
          StatefulBuilder(builder: (context, setInnerState) {
            return Column(children: [
              ...listItem.map((e) {
                return PrimaryInkWell(
                  onTap: () => setInnerState(() => e.value = !e.value),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: PrimaryRadio(
                      title: e.name,
                      selected: e.value,
                      onTap: () {
                        for (final f in listItem) {
                          setInnerState(() => f.value = (e == f));
                        }
                      },
                    ),
                  ),
                );
              })
            ]);
          }),
          const SizedBox(height: 10),
          const PrimaryTextField(
            minLines: 4,
            height: null,
            maxLines: 10,
            hintText: 'Write your note here',
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            onTap:
                listItem.where((e) => e.value == true).isEmpty ? null : () {},
            label: 'Submit',
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
