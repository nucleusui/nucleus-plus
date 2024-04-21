import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({super.key});

  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            label: 'Show Modal Dialog',
            onTap: () => showBottomSheet(context),
          ),
        ]),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(children: [
            PrimaryInkWell(
              onTap: () => Navigator.pop(context),
              child: const PrimaryAssetImage(AssetPaths.icClose, width: 18),
            ),
            const Spacer(),
            const Text(
              'Review your details',
              style: AssetStyles.labelLg,
            ),
            const Spacer(),
          ]),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.getColor(ColorKey.grey10),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Plan & Benefits',
                  textAlign: TextAlign.center,
                  style: AssetStyles.h2.copyWith(height: 1.2),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$5.99/month',
                  textAlign: TextAlign.center,
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
                const SizedBox(height: 24),
                ...[
                  'Cash advance',
                  'Credit score coaching',
                  'Get cashback on selected stores',
                ].map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: PrimaryAssetImage(
                            AssetPaths.icCheck,
                            width: 16,
                            color: AppColors.getColor(ColorKey.primary60),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(e, style: AssetStyles.pSm)),
                      ],
                    ),
                  );
                }),
                ...[
                  (title: 'Your first payment', value: 'Today'),
                  (title: 'Paid with', value: 'Apple pay'),
                ].map((e) {
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.title, style: AssetStyles.pMd),
                          Text(e.value, style: AssetStyles.h4),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const PrimaryDivider(),
                    ],
                  );
                }),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Subscribe',
            onTap: () {},
          ),
          SizedBox(height: screenHeight(context) / 4),
        ]),
      ),
    );
  }
}
