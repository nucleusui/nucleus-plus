import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class Feedback2Page extends StatefulWidget {
  const Feedback2Page({super.key});

  @override
  State<Feedback2Page> createState() => _Feedback2PageState();
}

class _Feedback2PageState extends State<Feedback2Page> {
  final listItem = [
    BasicModel(name: "Very satisfied", value: false),
    BasicModel(name: "Somewhat satisfied", value: false),
    BasicModel(name: "Neither satisfied nor dissatisfied", value: false),
    BasicModel(name: "Somewhat dissatisfied", value: false),
    BasicModel(name: "Very dissatisfied ", value: false),
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
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              PrimaryInkWell(
                onTap: () => Navigator.pop(context),
                child: const PrimaryAssetImage(AssetPaths.icClose),
              ),
              const Spacer(),
              const Spacer(),
              const Text('Share feedback', style: AssetStyles.h3),
              const Spacer(),
              PrimaryInkWell(
                onTap: () {},
                child: Text(
                  'Submit',
                  style: AssetStyles.h3.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 40),
            Text(
              'How satisfied are you with our\ndesign system?',
              style: AssetStyles.h2.copyWith(height: 1.2),
            ),
            const SizedBox(height: 24),
            ...listItem.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PrimaryRadio(
                  title: e.name,
                  selected: e.value,
                  onTap: () {
                    for (final f in listItem) {
                      f.value = false;
                    }
                    setInnerState(() => e.value = !e.value);
                  },
                ),
              );
            }),
            const SizedBox(height: 8),
            const Text('Additional Comments', style: AssetStyles.h4),
            const SizedBox(height: 16),
            const PrimaryTextField(
              minLines: 4,
              height: null,
              maxLines: 10,
              hintText: 'Let us know what you think',
            ),
            SizedBox(height: screenHeight(context) / 8),
          ]),
        );
      }),
    );
  }
}
