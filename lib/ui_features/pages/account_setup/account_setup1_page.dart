import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class AccountSetup1Page extends StatefulWidget {
  const AccountSetup1Page({super.key});

  @override
  State<AccountSetup1Page> createState() => _AccountSetup1PageState();
}

class _AccountSetup1PageState extends State<AccountSetup1Page> {
  final listItem = [
    BasicModel(name: "Avatars", value: false),
    BasicModel(name: "Badges", value: false),
    BasicModel(name: "Bars", value: true),
    BasicModel(name: "Buttons", value: false),
    BasicModel(name: "Chips", value: true),
    BasicModel(name: "Dialogs", value: false),
    BasicModel(name: "Dividers", value: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleWidget: Wrap(
          spacing: 5,
          alignment: WrapAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              Icons.circle,
              size: 8,
              color: index == 0
                  ? AppColors.getColor(ColorKey.primary60)
                  : AppColors.getColor(ColorKey.grey20),
            );
          }).toList(),
        ),
        actions: [
          PrimaryInkWell(
            onTap: () {},
            child: Text(
              'Next',
              style: AssetStyles.h3.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Select components',
              style: AssetStyles.h1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Nucleus will create all the components you\nchoose automatically',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listItem.length,
            padding: const EdgeInsets.only(top: 32),
            itemBuilder: (contex, index) {
              final data = listItem[index];
              return PrimaryChip(
                text: data.name,
                isActive: data.value,
                actions: Visibility(
                  visible: data.value,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: UniversalImage(
                      AssetPaths.icCheck,
                      width: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  final index = listItem.indexWhere((a) => a.name == data.name);
                  setState(
                      () => listItem[index].value = !listItem[index].value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
