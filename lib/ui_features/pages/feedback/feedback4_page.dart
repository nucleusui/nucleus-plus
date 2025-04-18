import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Feedback4Page extends StatefulWidget {
  const Feedback4Page({super.key});

  @override
  State<Feedback4Page> createState() => _Feedback4PageState();
}

class _Feedback4PageState extends State<Feedback4Page> {
  final listItem = [
    BasicModel(name: "No clear explanation", value: false),
    BasicModel(name: "The components don’t feel relevant", value: false),
    BasicModel(name: "The components don’t really solid", value: false),
    BasicModel(name: "The style is inconsistent", value: false),
    BasicModel(name: "Other", value: false),
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
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: const UniversalImage(AssetPaths.icClose),
            ),
            const SizedBox(height: 40),
            Text(
              'How was your experience with\nthe design system?',
              style: AssetStyles.h2.copyWith(height: 1.2),
            ),
            const SizedBox(height: 32),
            ...listItem.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PrimaryRadio(
                  title: e.name,
                  selected: e.value,
                  divider: false,
                  onTap: () {
                    for (final f in listItem) {
                      f.value = false;
                    }
                    setInnerState(() => e.value = !e.value);
                  },
                ),
              );
            }),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(
                child: Button.primary(
                  label: 'Send',
                  buttonSize: ButtonSize.full,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Button.secondary(
                  label: 'Cancel',
                  buttonSize: ButtonSize.full,
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ]),
            SizedBox(height: screenHeight(context) / 8),
          ]),
        );
      }),
    );
  }
}
