import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class Setting3Page extends StatefulWidget {
  const Setting3Page({super.key});

  @override
  State<Setting3Page> createState() => _Setting3PageState();
}

class _Setting3PageState extends State<Setting3Page> {
  final listItem = [
    (
      group: 'Account settings',
      menu: [
        (title: 'Personal info', onTap: () {}),
        (title: 'Password', onTap: () {}),
        (title: 'Email', onTap: () {}),
      ],
    ),
    (
      group: 'More',
      menu: [
        (title: 'Notifications', onTap: null),
        (title: 'Terms & conditions', onTap: () {}),
      ],
    ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: const PrimaryAssetImage(AssetPaths.icClose),
            ),
            const Spacer(),
            const Text('Settings', style: AssetStyles.h3),
            const Spacer(),
          ]),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.getColor(ColorKey.primary60),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Premium Membership',
                  style: AssetStyles.h3.copyWith(color: Colors.white),
                ),
                Text(
                  'Upgrade for more features',
                  style: AssetStyles.pSm.copyWith(color: Colors.white),
                ),
              ]),
              const Spacer(),
              const PrimaryAssetImage(
                AssetPaths.imgCrown,
                width: 48,
                height: 48,
              ),
            ]),
          ),
          const SizedBox(height: 16),
          ...listItem.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(e.group, style: AssetStyles.h4),
                const SizedBox(height: 16),
                ...e.menu.map((f) {
                  return PrimaryInkWell(
                    onTap: f.onTap,
                    child: SizedBox(
                      height: 64,
                      child: Row(children: [
                        Text(f.title, style: AssetStyles.pMd),
                        const Spacer(),
                        PrimaryAssetImage(
                          AssetPaths.icArrowNext,
                          color: AppColors.getColor(ColorKey.grey50),
                        ),
                      ]),
                    ),
                  );
                }),
              ],
            );
          }),
          SizedBox(height: screenHeight(context) / 10),
          PrimaryButton(
            color: Colors.transparent,
            labelStyle: AssetStyles.h4.copyWith(color: AssetColors.red),
            label: 'Log out',
            onTap: () {},
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
