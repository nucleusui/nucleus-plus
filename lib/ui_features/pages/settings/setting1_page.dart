import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Setting1Page extends StatefulWidget {
  const Setting1Page({super.key});

  @override
  State<Setting1Page> createState() => _Setting1PageState();
}

class _Setting1PageState extends State<Setting1Page> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
  ];
  final listItem = [
    BasicModel(
      name: 'General settings',
      value: false,
      icon: AssetPaths.icSettingThin,
    ),
    BasicModel(
      name: 'Profile',
      value: false,
      icon: AssetPaths.icUser,
    ),
    BasicModel(
      name: 'Discoverabillity',
      value: true,
      icon: AssetPaths.icColumnThin,
    ),
    BasicModel(
      name: 'Sound',
      value: true,
      icon: AssetPaths.icMusic,
    ),
    BasicModel(
      name: 'Connect to watch',
      value: false,
      icon: AssetPaths.icClock,
    ),
    BasicModel(
      name: 'Location',
      value: false,
      icon: AssetPaths.icDirectionThin,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Settings'),
      body: Wrap(
        children: listItem.asMap().entries.map((e) {
          return PrimaryInkWell(
            onTap: e.key < 2
                ? null
                : () => setState(() => e.value.value = !e.value.value),
            child: SizedBox(
              width: screenWidth(context) / 2,
              height: screenWidth(context) / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UniversalImage(
                    e.value.icon!,
                    width: 26,
                    height: 26,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                  const SizedBox(height: 12),
                  Text(e.value.name, style: AssetStyles.pMd),
                  if (e.key >= 2) ...[
                    const SizedBox(height: 11),
                    Text(
                      e.value.value
                          ? (e.value.name == 'Location' ? 'Enabled' : 'On')
                          : (e.value.name == 'Location' ? 'Disabled' : 'Off'),
                      style: AssetStyles.labelMd.copyWith(
                        color: e.value.value
                            ? AppColors.getColor(ColorKey.primary60)
                            : AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
