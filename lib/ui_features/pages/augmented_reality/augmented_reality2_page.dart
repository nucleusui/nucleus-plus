import 'package:flutter/material.dart';
import 'package:nucles_app/app/app_theme.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class AugemntedReality2Page extends StatefulWidget {
  const AugemntedReality2Page({super.key});

  @override
  State<AugemntedReality2Page> createState() => _AugemntedReality2PageState();
}

class _AugemntedReality2PageState extends State<AugemntedReality2Page> {
  String selected = 'AR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        const UniversalImage(
          AssetPaths.imgPlaceholder20,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const UniversalImage(AssetPaths.imgPlaceholder17, width: 135),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: PrimaryAppBar(
            leading: PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: const UniversalImage(
                AssetPaths.icClose,
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
            ),
            titleWidget: Container(
              height: 32,
              width: 180,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.getColor(ColorKey.grey10),
              ),
              child: Row(
                children: ['AR', 'Object'].map((e) {
                  final active = selected == e;
                  return PrimaryInkWell(
                    onTap: () => setState(() => selected = e),
                    child: Container(
                      height: 28,
                      width: 88,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: active ? Colors.white : Colors.transparent,
                        boxShadow: !active
                            ? null
                            : [
                                BoxShadow(
                                  offset: const Offset(1, 1),
                                  blurRadius: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ],
                      ),
                      child: Text(
                        e,
                        style: AssetStyles.h6.copyWith(
                          color: active
                              ? AppColors.getColor(themeNotifier.value
                                  ? ColorKey.background
                                  : ColorKey.grey100)
                              : AppColors.getColor(ColorKey.grey60),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            actions: const [
              UniversalImage(
                AssetPaths.icShare,
                width: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 32),
          child: Container(
            width: 72,
            height: 72,
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  width: 1.5,
                  color: Colors.transparent.withValues(alpha: .5),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
