import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Feedback1Page extends StatefulWidget {
  const Feedback1Page({super.key});

  @override
  State<Feedback1Page> createState() => _Feedback1PageState();
}

class _Feedback1PageState extends State<Feedback1Page> {
  final listItem = [
    BasicModel(name: "I don't understand how to use it", value: false),
    BasicModel(name: "No clear explanation", value: false),
    BasicModel(name: "The components don't feel relevant", value: false),
    BasicModel(name: "The components don't really solid", value: false),
    BasicModel(name: "The style is inconsistent", value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        title: 'Feedback',
        leading: IconButton(
          onPressed: backScreen,
          icon: UniversalImage(AssetPaths.icClose),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Text(
            'How was your\nexperience with the\ndesign system?',
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'Let us know what you think about our this component',
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 36),
          ...listItem.map((e) {
            return PrimaryInkWell(
              onTap: () => setState(() => e.value = !e.value),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(children: [
                  PrimaryCheckBox(
                    value: e.value,
                    onChanged: (vale) => setState(() => e.value = !e.value),
                  ),
                  const SizedBox(width: 12),
                  Text(e.name, style: AssetStyles.pMd),
                ]),
              ),
            );
          }),
          const SizedBox(height: 10),
          const TextFields(
            minLines: 4,
            height: null,
            maxLines: 10,
            hintText: 'Write a note',
          ),
          const SizedBox(height: 16),
          Button.primary(
            label: 'Submit',
            buttonSize: ButtonSize.full,
            onTap: listItem.where((e) => e.value == true).isEmpty
                ? null
                : () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
