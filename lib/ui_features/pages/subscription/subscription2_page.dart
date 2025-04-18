import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Subscription2Page extends StatefulWidget {
  const Subscription2Page({super.key});

  @override
  State<Subscription2Page> createState() => _Subscription2PageState();
}

class _Subscription2PageState extends State<Subscription2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const UniversalImage(
          AssetPaths.imgPlaceholder6,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            children: [
              Text(
                'Get unlimited access\nto everything',
                style: AssetStyles.h1.copyWith(height: 1.2),
              ),
              const SizedBox(height: 24),
              ...[
                (
                  icon: AssetPaths.icLockBold,
                  title: 'Today',
                  subtitle:
                      'Get full access to 1000+ UI components, Style library, icons and illustration.',
                ),
                (
                  icon: AssetPaths.icEmailBold,
                  title: 'In 3 Days',
                  subtitle:
                      'Get full access to 1000+ UI components, Style library, icons and illustration.',
                ),
                (
                  icon: AssetPaths.icCard,
                  title: 'In 7 Days',
                  subtitle:
                      'You\'ll be charged today, cancel anytime before then.',
                ),
              ].map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Button.primary(
                        icon: UniversalImage(
                          e.icon,
                          width: e.icon == AssetPaths.icLockBold ? 18 : 20,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title, style: AssetStyles.h4),
                            const SizedBox(height: 4),
                            Text(
                              e.subtitle,
                              style: AssetStyles.pSm.copyWith(
                                color: AppColors.getColor(ColorKey.grey60),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '7 day free trial then \$99.99 billed annually.',
              style: AssetStyles.pSm.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            const SizedBox(height: 16),
            Button.primary(
              label: 'Subscribe',
              buttonSize: ButtonSize.full,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
