import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        const PrimaryAssetImage(
          AssetPaths.flagAU,
          height: 30,
        ),
        const SizedBox(width: 5),
        Text(
          "+61",
          style: AssetStyles.pMd.copyWith(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(AssetPaths.icArrowDown)
      ]),
    );
  }
}
