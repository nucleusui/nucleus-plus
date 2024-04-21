import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_switch.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Profile4Page extends StatefulWidget {
  const Profile4Page({super.key});

  @override
  State<Profile4Page> createState() => _Profile4PageState();
}

class _Profile4PageState extends State<Profile4Page> {
  int currentIndex = 3;

  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];

  final menu1 = [
    (
      title: 'My Favorite',
      icon: AssetPaths.icLike,
      onTap: () {},
    ),
    (
      title: 'Downloads',
      icon: AssetPaths.icDownload,
      onTap: () {},
    ),
  ];

  final menu2 = [
    BasicModel(
      name: 'Dark Mode',
      icon: AssetPaths.icMoon,
      value: false,
    ),
    BasicModel(
      name: 'Download via Wi-Fi Only',
      icon: AssetPaths.icWifi,
      value: true,
    ),
    BasicModel(
      name: 'Play in Background',
      icon: AssetPaths.icCopy,
      value: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(shrinkWrap: true, children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const PrimaryAssetImage(
                    AssetPaths.imgUser2,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Owen', style: AssetStyles.h2.copyWith(height: 1.2)),
                      const Text('owen@nucleus-ui.com', style: AssetStyles.pMd),
                    ],
                  ),
                ]),
                const SizedBox(height: 16),
                PrimaryButton(
                  label: 'Edit Profile',
                  color: AppColors.getColor(ColorKey.primary20),
                  labelColor: AppColors.getColor(ColorKey.primary70),
                  onTap: () {},
                ),
              ],
            ),
          ),
          ...menu1.map((e) {
            return PrimaryInkWell(
              onTap: e.onTap,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: Row(children: [
                  PrimaryAssetImage(
                    e.icon,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                  const SizedBox(width: 16),
                  Text(e.title, style: AssetStyles.pMd),
                  const Spacer(),
                  PrimaryAssetImage(
                    AssetPaths.icArrowNext,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ]),
              ),
            );
          }),
          const SizedBox(height: 16),
          Container(
            height: 12,
            color: AppColors.getColor(ColorKey.grey10),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Settings', style: AssetStyles.h4),
          ),
          const SizedBox(height: 16),
          ...menu2.map((e) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
              child: Row(children: [
                PrimaryAssetImage(
                  e.icon!,
                  color: AppColors.getColor(ColorKey.grey100),
                ),
                const SizedBox(width: 16),
                Text(e.name, style: AssetStyles.pMd),
                const Spacer(),
                PrimarySwitch(
                  value: e.value,
                  onChanged: (value) => setState(() => e.value = !e.value),
                ),
                const SizedBox(width: 16),
              ]),
            );
          }),
        ]),
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
