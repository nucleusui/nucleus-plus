import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Setting4Page extends StatefulWidget {
  const Setting4Page({super.key});

  @override
  State<Setting4Page> createState() => _Setting4PageState();
}

class _Setting4PageState extends State<Setting4Page> {
  String status = 'In a meeting';
  final listItem = [
    (title: 'Personal info', icon: AssetPaths.icUserBold, onTap: () {}),
    (title: 'Password', icon: AssetPaths.icLock, onTap: () {}),
    (title: 'Email', icon: AssetPaths.icEmail, onTap: () {}),
    (title: 'Log out', icon: AssetPaths.icLogout, onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        UniversalImage(
          AssetPaths.icMore,
          width: 20,
          color: AppColors.getColor(ColorKey.primary60),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            const UniversalImage(
              AssetPaths.imgUser1,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('James Ryan', style: AssetStyles.h3),
              Text(
                'Product Design',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
            ]),
            const Spacer(),
            Button.secondary(
              label: 'Edit',
              buttonSize: ButtonSize.small,
              onPressed: () => Navigator.pop(context),
            ),
          ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            children: ['In a meeting', 'At work', 'Busy', 'Out side'].map((e) {
              final active = e == status;
              return Visibility(
                visible: active,
                replacement: Button.outline(
                  label: e,
                  onPressed: () => setState(() => status = e),
                ),
                child: Button.primary(
                  label: e,
                  onPressed: () => setState(() => status = e),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        const PrimaryDivider(),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Account', style: AssetStyles.h4),
        ),
        ...listItem.map((e) {
          final isLogout = e.title == 'Log out';

          return PrimaryInkWell(
            onTap: e.onTap,
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                UniversalImage(
                  e.icon,
                  width: 18,
                  color: isLogout
                      ? AssetColors.red
                      : AppColors.getColor(ColorKey.grey100),
                ),
                const SizedBox(width: 16),
                Text(
                  e.title,
                  style: AssetStyles.pMd.copyWith(
                    color: isLogout ? AssetColors.red : null,
                  ),
                ),
                const Spacer(),
                UniversalImage(
                  AssetPaths.icArrowNext,
                  color: isLogout
                      ? Colors.transparent
                      : AppColors.getColor(ColorKey.grey50),
                ),
              ]),
            ),
          );
        }),
      ]),
    );
  }
}
