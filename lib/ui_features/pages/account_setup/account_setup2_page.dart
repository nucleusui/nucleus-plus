import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class AccountSetup2Page extends StatefulWidget {
  const AccountSetup2Page({super.key});

  @override
  State<AccountSetup2Page> createState() => _AccountSetup2PageState();
}

class _AccountSetup2PageState extends State<AccountSetup2Page> {
  final listItem = [
    BasicModel(name: "Learn about design system", value: true),
    BasicModel(name: "Make design process faster", value: false),
    BasicModel(name: "Support collaboration with engineer", value: false),
    BasicModel(name: "Just looking around", value: false),
    BasicModel(name: "I don’t want to say", value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Set your account'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: "Next",
          buttonSize: ButtonSize.full,
          onPressed: () {},
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          Stack(alignment: Alignment.centerLeft, children: [
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.getColor(ColorKey.grey20),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 4,
              width: 34,
              decoration: BoxDecoration(
                color: AppColors.getColor(ColorKey.primary60),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ]),
          const SizedBox(height: 32),
          const Text(
            'Tell us your goal',
            style: AssetStyles.h1,
          ),
          const SizedBox(height: 8),
          Text(
            'We will recommend design approaches that suit you',
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 24),
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
                  Text(
                    e.name,
                    style: e.value
                        ? AssetStyles.h4.copyWith(
                            color: AppColors.getColor(ColorKey.primary60))
                        : AssetStyles.pMd,
                  ),
                ]),
              ),
            );
          }),
        ],
      ),
    );
  }
}
