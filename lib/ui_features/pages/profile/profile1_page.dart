import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Profile1Page extends StatefulWidget {
  const Profile1Page({super.key});

  @override
  State<Profile1Page> createState() => _Profile1PageState();
}

class _Profile1PageState extends State<Profile1Page> {
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryInkWell(
                onTap: () => Navigator.pop(context),
                child: const UniversalImage(AssetPaths.icClose),
              ),
              const SizedBox(height: 40),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hi, Shanice', style: AssetStyles.h1),
                    Text(
                      'Joined in 2019',
                      style: AssetStyles.pMd.copyWith(
                        color: AppColors.getColor(ColorKey.grey60),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const UniversalImage(
                  AssetPaths.imgUser3,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ]),
              const SizedBox(height: 32),
              Row(
                children: [
                  (icon: AssetPaths.icStarBold, text: '487 reviews'),
                  (icon: AssetPaths.icShield, text: 'Identity verified')
                ].map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: Row(children: [
                      UniversalImage(
                        e.icon,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        e.text,
                        style: AssetStyles.pMd.copyWith(
                          color: AppColors.getColor(ColorKey.grey60),
                        ),
                      ),
                    ]),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const PrimaryDivider(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('About', style: AssetStyles.h3),
              const SizedBox(height: 8),
              Text.rich(
                style: AssetStyles.pMd,
                TextSpan(
                  text:
                      'Hello, I am Shanice and I\'ve worked in the design industry for the past... ',
                  children: [
                    TextSpan(
                      text: 'read more',
                      style: AssetStyles.labelMd.copyWith(
                          color: AppColors.getColor(ColorKey.primary70)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(children: [
                UniversalImage(
                  AssetPaths.icCircle,
                  color: AppColors.getColor(ColorKey.grey100),
                ),
                const SizedBox(width: 16),
                const Text('Speaks English. Francis', style: AssetStyles.pMd),
              ]),
              const SizedBox(height: 48),
              const Text('James has confirmed', style: AssetStyles.h3),
              const SizedBox(height: 16),
              ...[
                'Identity',
                'Email address',
                'Phone number',
              ].map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(children: [
                    UniversalImage(
                      AssetPaths.icCircle,
                      color: AppColors.getColor(ColorKey.grey100),
                    ),
                    const SizedBox(width: 16),
                    Text(e, style: AssetStyles.pMd),
                  ]),
                );
              }),
            ],
          ),
        ),
        SizedBox(height: screenHeight(context) * 0.15),
      ]),
    );
  }
}
