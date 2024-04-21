import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_checkbox.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';

class Invite2Page extends StatefulWidget {
  const Invite2Page({super.key});

  @override
  State<Invite2Page> createState() => _Invite2PageState();
}

class _Invite2PageState extends State<Invite2Page> {
  final searchController = TextEditingController();
  List<BasicModel> searchList = [];
  final listItem = [
    BasicModel(
      name: 'Owen Mitchell',
      icon: AssetPaths.imgUser1,
      value: false,
    ),
    BasicModel(
      name: 'Mason Hayes',
      icon: AssetPaths.imgUser2,
      value: false,
    ),
    BasicModel(
      name: 'Sophia Lawson',
      icon: AssetPaths.imgUser3,
      value: false,
    ),
    BasicModel(
      name: 'Caleb Parker',
      icon: AssetPaths.imgUser1,
      value: false,
    ),
    BasicModel(
      name: 'Lucas Anderson',
      icon: AssetPaths.imgUser7,
      value: false,
    ),
    BasicModel(
      name: 'Emma Fitzgerald',
      icon: AssetPaths.imgUser6,
      value: false,
    ),
    BasicModel(
      name: 'Olivia Reed',
      icon: AssetPaths.imgUser3,
      value: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Invite friends', style: AssetStyles.h1),
              Text(
                'Invite a friend and share Nucleus',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                height: 32,
                width: 108,
                label: 'Share link',
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const PrimaryDivider(),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PrimaryTextField(
            height: 48,
            hintText: 'Search',
            controller: searchController,
            contentPadding: const EdgeInsets.only(top: 9),
            fillColor: AppColors.getColor(ColorKey.grey10),
            borderRadius: BorderRadius.circular(100),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 8, 10),
              child: PrimaryAssetImage(
                AssetPaths.icSearch,
                width: 16,
                height: 16,
                color: AppColors.getColor(ColorKey.grey100),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchList = listItem.where((e) {
                  return e.name.toLowerCase().contains(value.toLowerCase());
                }).toList();
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('120 Contacts', style: AssetStyles.h3),
              const SizedBox(height: 4),
              Text(
                'Select from your phone contact',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...(searchController.text.isEmpty ? listItem : searchList).map((e) {
          return PrimaryInkWell(
            onTap: () => setState(() => e.value = !e.value),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(children: [
                const SizedBox(width: 8),
                PrimaryCheckBox(
                  value: e.value,
                  scale: 1.3,
                  onChanged: (value) => setState(() => e.value = !e.value),
                ),
                const SizedBox(width: 20),
                PrimaryAssetImage(e.icon!, width: 40, height: 40),
                const SizedBox(width: 20),
                Text(e.name, style: AssetStyles.pMd),
              ]),
            ),
          );
        }),
      ]),
    );
  }
}
