import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: const UniversalImage(AssetPaths.icClose),
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
              const UniversalImage(
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
                        UniversalImage(
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
          Button.destructive(
            label: 'Log out',
            color: Colors.transparent,
            labelColor: AssetColors.red,
            buttonSize: ButtonSize.full,
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
