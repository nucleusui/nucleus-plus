import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';

class Share1Page extends StatefulWidget {
  const Share1Page({super.key});

  @override
  State<Share1Page> createState() => _Share1PageState();
}

class _Share1PageState extends State<Share1Page> {
  int slideIndex = 0;
  final listCard = [
    (icon: AssetPaths.icLink, title: 'Copy Link'),
    (icon: AssetPaths.icChat, title: 'Messafes'),
    (icon: AssetPaths.icEmail, title: 'Email'),
    (icon: AssetPaths.icMore, title: 'More'),
  ];
  final listItem = [
    (
      image: AssetPaths.imgPlaceholder2,
      title: 'Get \$15',
      subtitle: 'When a friend join via your link',
    ),
    (
      image: AssetPaths.imgPlaceholder1,
      title: 'Get \$15',
      subtitle: 'When a friend join via your link',
    ),
    (
      image: AssetPaths.imgPlaceholder3,
      title: 'Get \$15',
      subtitle: 'When a friend join via your link',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Share and earn', style: AssetStyles.h1),
                Text(
                  'Invite your friends and enjoy discount.',
                  style: AssetStyles.pMd.copyWith(
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 228,
            child: PageView(
              padEnds: false,
              controller: PageController(viewportFraction: 0.9),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) => setState(() => slideIndex = value),
              children: listItem.asMap().entries.map((e) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  margin: EdgeInsets.only(
                      left: 16, right: e.key != (listItem.length - 1) ? 0 : 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(e.value.image),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        e.value.title,
                        style: AssetStyles.h2.copyWith(color: Colors.white),
                      ),
                      Text(
                        e.value.subtitle,
                        style: AssetStyles.h5.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.start,
              children: listItem.asMap().entries.map((e) {
                return UniversalImage(
                  AssetPaths.icCircleFill,
                  width: 8,
                  color: e.key == slideIndex
                      ? AppColors.getColor(ColorKey.primary60)
                      : AppColors.getColor(ColorKey.grey20),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          const PrimaryDivider(),
          const SizedBox(height: 8),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: listCard.map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(children: [
                  Text(e.title, style: AssetStyles.pMd),
                  const Spacer(),
                  UniversalImage(
                    e.icon,
                    width: 16,
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ]),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
