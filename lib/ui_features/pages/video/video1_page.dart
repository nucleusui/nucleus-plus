import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Video1Page extends StatelessWidget {
  const Video1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = [
      (
        title: 'The Mouse’s tale',
        time: '28m',
        image: AssetPaths.imgPlaceholder4,
        description:
            'In 1845 Carroll had made a collection of booklets for his younger brother and sister, which he called “Useful and Instructive Poetry”.'
      ),
      (
        title: 'You are old, Father William',
        time: '27m',
        image: AssetPaths.imgPlaceholder5,
        description:
            'Jo Elwyn Jones and J. Francis Gladstone (Jones and Gladstone) argue that Carroll’s poem is also a parody on the Oxford professor.'
      ),
      (
        title: 'Speak roughly to your little boy',
        time: '27m',
        image: AssetPaths.imgPlaceholder1,
        description:
            'There is some uncertainty as to the author of this poem, for it occasionally appears as anonymous, or credited to David Bates'
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            const UniversalImage(
              AssetPaths.imgPlaceholder2,
              height: 211,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Button.outline(
                label: 'Watch Preview',
                labelColor: Colors.white,
                border: BorderSide(color: Colors.white),
                buttonSize: ButtonSize.small,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ]),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              children: [
                Row(children: [
                  Text(
                    'Season 1',
                    style: AssetStyles.h3.copyWith(
                      color: AppColors.getColor(ColorKey.grey100),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const UniversalImage(AssetPaths.icArrowDown)
                ]),
                const SizedBox(height: 16),
                ...videos.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(children: [
                      Row(children: [
                        UniversalImage(
                          e.image,
                          fit: BoxFit.cover,
                          width: 120,
                          height: 68,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: AssetStyles.h4.copyWith(
                                  color: AppColors.getColor(ColorKey.grey100),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                e.time,
                                style: AssetStyles.pSm.copyWith(
                                  color: AppColors.getColor(ColorKey.grey60),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        const UniversalImage(AssetPaths.icDownload)
                      ]),
                      const SizedBox(height: 12),
                      Text(
                        e.description,
                        style: AssetStyles.pSm.copyWith(
                          color: AppColors.getColor(ColorKey.grey60),
                          height: 1.5,
                        ),
                      )
                    ]),
                  );
                }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
