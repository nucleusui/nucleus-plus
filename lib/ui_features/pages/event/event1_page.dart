import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Event1Page extends StatelessWidget {
  const Event1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Event', actions: [
        SvgPicture.asset(AssetPaths.icShare),
        const SizedBox(width: 20),
        SvgPicture.asset(AssetPaths.icStarBold),
        const SizedBox(width: 5),
      ]),
      body: ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        PrimaryAssetImage(
          AssetPaths.imgPlaceholder2,
          fit: BoxFit.cover,
          height: screenHeight(context) / 2.5,
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const Text('Design system workshop', style: AssetStyles.h2),
            const SizedBox(height: 24),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: PrimaryAssetImage(AssetPaths.icCalendar),
              ),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  'Monday, 24 Jan 2022\n12:00 AM - 2:00 AM SGT',
                  style: AssetStyles.h4,
                ),
                Text(
                  'Times are displayed in your local time zone.',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add to calendar',
                  style: AssetStyles.h5.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
              ]),
            ]),
            const SizedBox(height: 24),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: PrimaryAssetImage(AssetPaths.icMapPin),
              ),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('The Industrial Park', style: AssetStyles.h4),
                Text(
                  '101 South Sutton',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                ),
              ]),
            ]),
            const SizedBox(height: 24),
            Text(
              'FROM THE GROUP',
              style: AssetStyles.h5.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            const SizedBox(height: 12),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              PrimaryAssetImage(
                AssetPaths.imgPlaceholder2,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
              ),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Designerdz',
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                Text(
                  'Public',
                  style: AssetStyles.pSm.copyWith(
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                ),
              ])
            ]),
            const SizedBox(height: 16),
          ],
        ),
      ]),
      bottomNavigationBar: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: AppColors.getColor(ColorKey.grey30),
            ),
          ),
        ),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Free',
                style: AssetStyles.h4.copyWith(
                  height: 1.2,
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
              Text(
                '12 spots left',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            label: 'RSVP',
            height: 40,
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
