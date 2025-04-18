import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Event4Page extends StatefulWidget {
  const Event4Page({super.key});

  @override
  State<Event4Page> createState() => _Event4PageState();
}

class _Event4PageState extends State<Event4Page> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight(context) / 3.5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'TODAY 8:30 PM',
                style: AssetStyles.h5.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Design System Mantra', style: AssetStyles.h2),
              const SizedBox(height: 8),
              Text(
                'Online Learning',
                style: AssetStyles.pSm.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  AssetPaths.imgUser1,
                  AssetPaths.imgUser3,
                  AssetPaths.imgUser6,
                  AssetPaths.imgUser7,
                  AssetPaths.imgUser2,
                ].asMap().entries.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(left: e.key * 20),
                    child: UniversalImage(e.value, width: 40, height: 40),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                'Design System is not a deliverable, but a set of deliverables. It will evolve constantly with the product, the tools and the new technologies.',
                style: AssetStyles.pSm,
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (icon: AssetPaths.icShare, title: 'Share'),
              (icon: AssetPaths.icTwitter, title: 'Tweet'),
              (icon: AssetPaths.icCopy, title: 'Copy Link'),
              (icon: AssetPaths.icCalendar, title: 'Add to Cal'),
            ].map((e) {
              return Column(children: [
                UniversalImage(
                  e.icon,
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                  color: AppColors.getColor(ColorKey.primary60),
                ),
                const SizedBox(height: 4),
                Text(
                  e.title,
                  style: AssetStyles.pXs.copyWith(
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                ),
              ]);
            }).toList(),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
