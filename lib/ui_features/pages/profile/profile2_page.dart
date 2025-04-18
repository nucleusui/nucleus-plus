import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Profile2Page extends StatelessWidget {
  const Profile2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icMoreVert,
            height: 18,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            const UniversalImage(
              AssetPaths.imgUser1,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Button.secondary(
              height: 32,
              width: 32,
              icon: UniversalImage(
                AssetPaths.icNotification,
                width: 16,
                color: AppColors.getColor(ColorKey.primary70),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 12),
            Button.primary(
              label: 'Following',
              buttonSize: ButtonSize.small,
              onPressed: () => Navigator.pop(context),
            ),
          ]),
          const SizedBox(height: 24),
          const Text('James Ryan', style: AssetStyles.h2),
          Text(
            '@jamesryan',
            style: AssetStyles.h5.copyWith(
              color: AppColors.getColor(ColorKey.grey60),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ('74.5k', 'followers'),
              ('2.9k', 'followers'),
            ].map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.$1, style: AssetStyles.h3),
                    Text(e.$2, style: AssetStyles.pSm),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Chief Design officer, I love making the things that help others do their thing.',
            style: AssetStyles.pMd.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              (AssetPaths.icTwitterBold, 'Jamesryan'),
              (AssetPaths.icInstagramBold, 'James_ryan'),
            ].map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(children: [
                  UniversalImage(
                    e.$1,
                    width: 12,
                    height: 12,
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                  const SizedBox(width: 6),
                  Text(e.$2, style: AssetStyles.pSm),
                ]),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Joined 22 Apr 2020',
            style: AssetStyles.pXs.copyWith(
              color: AppColors.getColor(ColorKey.grey60),
            ),
          ),
          const SizedBox(height: 24),
          const PrimaryDivider(),
          const SizedBox(height: 24),
          ...[
            (
              day: 'Today',
              time: '11:30 PM',
              title: 'How to map user journey',
              description:
                  'Having a design system in place is  a simple solution to keep you and a simple solution to keep you and'
            ),
            (
              day: 'Yesterday',
              time: '08:30 PM',
              title: 'Design better with Nucleus',
              description:
                  'Having a design system in place is  a simple solution to keep you and a simple solution to keep you and'
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth(context) * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.day,
                          style: AssetStyles.h6.copyWith(
                            color: AppColors.getColor(ColorKey.grey60),
                          ),
                        ),
                        Text(e.time, style: AssetStyles.h5),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.title, style: AssetStyles.h4),
                        const SizedBox(height: 8),
                        Text(
                          e.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
