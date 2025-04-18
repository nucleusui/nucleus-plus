import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Permission1Page extends StatefulWidget {
  const Permission1Page({super.key});

  @override
  State<Permission1Page> createState() => _Permission1PageState();
}

class _Permission1PageState extends State<Permission1Page> {
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
          onPressed: () => showBottomSheet(context),
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
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                'Later',
                style: AssetStyles.h3.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 32),
          UniversalImage(
            AssetPaths.imgPlaceholder2,
            height: 183,
            fit: BoxFit.cover,
            width: double.infinity,
            borderRadius: BorderRadius.circular(16),
          ),
          const SizedBox(height: 16),
          Text(
            'Stay up to date',
            style: AssetStyles.h1.copyWith(height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'Ensure a seamless Nucleus experience by\nallowing notifications',
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 24),
          ...[
            (
              icon: AssetPaths.icInfo,
              title: 'Important feature updates',
            ),
            (
              icon: AssetPaths.icChat,
              title:
                  'Alert whenever your team make changes, comments on your design system',
            ),
            (
              icon: AssetPaths.icColumnBold,
              title:
                  'Interesting articel and stories around building cool design system',
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: UniversalImage(
                      e.icon,
                      width: 16,
                      color: AppColors.getColor(ColorKey.grey100),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      e.title,
                      style: AssetStyles.pMd,
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: screenHeight(context) / 8),
          Button.primary(
            label: 'Allow notifications',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
