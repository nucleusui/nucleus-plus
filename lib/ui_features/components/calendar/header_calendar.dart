import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class HeaderCalendar extends StatelessWidget {
  const HeaderCalendar({super.key, this.startRange, this.endRange});

  final DateTime? startRange;
  final DateTime? endRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            startRange != null
                ? DateFormat("E, d MMM").format(startRange!)
                : DateFormat("E, d MMM").format(DateTime.now()),
            style: AssetStyles.h3,
          ),
          Text(
            "10:00 AM",
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
        ]),
        const Spacer(),
        const PrimaryAssetImage(AssetPaths.icArrowRight, color: Colors.black),
        const Spacer(),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            endRange != null
                ? DateFormat("E, d MMM").format(endRange!)
                : DateFormat("E, d MMM")
                    .format(DateTime.now().add(const Duration(days: 3))),
            style: AssetStyles.h3,
          ),
          Text(
            "10:00 AM",
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
        ]),
      ]),
    );
  }
}
