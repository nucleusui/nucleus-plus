import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Subscription5Page extends StatefulWidget {
  const Subscription5Page({super.key});

  @override
  State<Subscription5Page> createState() => _Subscription5PageState();
}

class _Subscription5PageState extends State<Subscription5Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const UniversalImage(
          AssetPaths.imgPlaceholder1,
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
                'Nucleus UI',
                style: AssetStyles.h4.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
              Text(
                'Upgrade plan',
                style: AssetStyles.h1.copyWith(height: 1.2),
              ),
              const SizedBox(height: 24),
              ...[
                (
                  icon: AssetPaths.icCheck,
                  subtitle:
                      'Get full access to 1000+ UI components, Style library, icons and illustration.',
                ),
                (
                  icon: AssetPaths.icCheck,
                  subtitle:
                      'Unlock Illustration icons in various UI design styles for web, mobile',
                ),
                (
                  icon: AssetPaths.icCheck,
                  subtitle: 'Access to 750+ UI screens for web and mobile.',
                ),
              ].map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: UniversalImage(
                          e.icon,
                          width: 16,
                          color: AppColors.getColor(ColorKey.primary60),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          e.subtitle,
                          style: AssetStyles.pSm.copyWith(
                            color: AppColors.getColor(ColorKey.grey60),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 16),
              const Text(
                '\$37.99 annually (\$6.99/month)',
                style: AssetStyles.h4,
              ),
              const SizedBox(height: 4),
              Text(
                'Try 7 days free, cancel anytime.',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Button.primary(
              label: 'Subscribe',
              buttonSize: ButtonSize.full,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            Button.ghost(
              label: 'Not now',
              buttonSize: ButtonSize.full,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
