import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';

class AccountSetup4Page extends StatefulWidget {
  const AccountSetup4Page({super.key});

  @override
  State<AccountSetup4Page> createState() => _AccountSetup4PageState();
}

class _AccountSetup4PageState extends State<AccountSetup4Page> {
  final locationController = TextEditingController(text: 'Michigan');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Text("Set location", style: AssetStyles.h1),
          const SizedBox(height: 4),
          Text(
            "Enter your location to find them.",
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 30),
          PrimaryTextField(
            controller: locationController,
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 8, 0),
              child: UniversalImage(
                AssetPaths.icMapPin,
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ),
            hintText: "Find Location",
          ),
          const SizedBox(height: 16),
          ...[
            (icon: AssetPaths.icDirection, label: 'Use current location'),
            (icon: AssetPaths.icMapPin, label: '1266 Michigan Ave'),
          ].map((e) {
            return Column(
              children: [
                const SizedBox(height: 16),
                Row(children: [
                  UniversalImage(
                    e.icon,
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Text(e.label),
                ]),
                const SizedBox(height: 16),
                const PrimaryDivider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
