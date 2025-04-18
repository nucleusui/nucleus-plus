import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/dialog/primary_dialog.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Permission4Page extends StatefulWidget {
  const Permission4Page({super.key});

  @override
  State<Permission4Page> createState() => _Permission4PageState();
}

class _Permission4PageState extends State<Permission4Page> {
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

  void showBottomSheet(BuildContext context) {
    return primaryDialog(
      context,
      radius: 16,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'To get started, Nucleus\nneeds your permissions',
            textAlign: TextAlign.center,
            style: AssetStyles.h2.copyWith(height: 1.2),
          ),
          const SizedBox(height: 24),
          ...[
            (
              title: 'Camera access',
              subtitle: 'Let Nucleus capture image using the camera',
            ),
            (
              title: 'Photo library',
              subtitle:
                  'Let Nucleus save and view photos from your photo library',
            ),
            (
              title: 'Location',
              subtitle: 'Let Nucleus access your location information.',
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: UniversalImage(
                    AssetPaths.icCheck,
                    width: 16,
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title, style: AssetStyles.h3),
                      Text(
                        e.subtitle,
                        style: AssetStyles.pSm.copyWith(
                          color: AppColors.getColor(ColorKey.grey60),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }),
          const SizedBox(height: 8),
          Button.primary(
            label: 'Allow notifications',
            buttonSize: ButtonSize.full,
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 8),
          Button.ghost(
            label: 'Not now',
            buttonSize: ButtonSize.full,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
