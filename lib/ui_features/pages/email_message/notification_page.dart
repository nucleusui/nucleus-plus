import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Notification'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          (
            title: 'You and Amanda are now friends.',
            time: '7m',
            image: AssetPaths.imgUser1,
          ),
          (
            title: 'Andy saw the Designer Group.',
            time: '1h',
            image: AssetPaths.imgUser2,
          ),
          (
            title: 'Amanda is now following you!',
            time: '3h',
            image: AssetPaths.imgUser3,
          ),
          (
            title: 'Shanice is joining Nucleus',
            time: '5h',
            image: AssetPaths.imgUser7,
          ),
          (
            title: 'Tommy is joining Nucleus',
            time: '1d',
            image: AssetPaths.imgUser4,
          ),
          (
            title: 'You and Jeremy are now friends.',
            time: '1d',
            image: AssetPaths.imgUser5,
          )
        ].map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(children: [
              UniversalImage(
                e.image,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(100),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      overflow: TextOverflow.ellipsis,
                      style: AssetStyles.pMd,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      e.time,
                      style: AssetStyles.pSm.copyWith(
                        color: AppColors.getColor(ColorKey.grey50),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              UniversalImage(
                AssetPaths.icCircleFill,
                width: 8,
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
