import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class FeatureInfo5Page extends StatelessWidget {
  const FeatureInfo5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(hideLeading: true, actions: [
        Button.ghost(
          label: 'Not now',
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: UniversalImage(
                  AssetPaths.imgPicture,
                  height: 162,
                  width: 162,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Start here',
                style: AssetStyles.labelMd.copyWith(
                  color: AppColors.getColor(ColorKey.primary70),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Experience New Design\nSystem in Nucleus',
                style: AssetStyles.h2.copyWith(height: 1.2),
              ),
            ]),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              children: [
                (
                  icon: AssetPaths.icSave,
                  title: 'Build your foundations',
                  subtitle:
                      'Design the foundation and save colors, character styles, sounds, components, and more to your design system.',
                ),
                (
                  icon: AssetPaths.icSave,
                  title: 'Est laborum consectetur incididunt duis sint ipsum.',
                  subtitle:
                      'Voluptate ut aliquip minim ex officia cillum exercitation proident sunt aute nulla. Magna velit dolore minim consequat velit est. Sit nulla elit voluptate laborum excepteur sunt adipisicing ad in aliquip ipsum reprehenderit minim.',
                ),
                (
                  icon: AssetPaths.icSave,
                  title: 'Reprehenderit nisi tempor',
                  subtitle:
                      'Cupidatat mollit qui laborum adipisicing aliquip nostrud reprehenderit incididunt anim est adipisicing aliquip nostrud reprehenderit.',
                ),
              ].map((e) {
                return Container(
                  width: screenWidth(context) - 64,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.getColor(ColorKey.grey20),
                    ),
                  ),
                  child: Column(children: [
                    Row(children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.getColor(ColorKey.primary20),
                        child: UniversalImage(e.icon),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          e.title,
                          overflow: TextOverflow.ellipsis,
                          style: AssetStyles.h4,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),
                    Text(
                      e.subtitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AssetStyles.pSm,
                    ),
                  ]),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'This is just an additional text that you may need to explain something to people before commiting using a feature.',
              style: AssetStyles.pXs.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Button.primary(
              label: 'Activate',
              buttonSize: ButtonSize.full,
              onPressed: () {},
            ),
          ),
        ]),
      ),
    );
  }
}
