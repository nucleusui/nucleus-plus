import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Wallet2Page extends StatefulWidget {
  const Wallet2Page({super.key});

  @override
  State<Wallet2Page> createState() => _Wallet2PageState();
}

class _Wallet2PageState extends State<Wallet2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$21.30', style: AssetStyles.h1),
                  Text('One-time card', style: AssetStyles.pSm),
                ],
              ),
            ),
            Spacer(),
            PrimaryAssetImage(
              AssetPaths.imgUser1,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ]),
          const SizedBox(height: 24),
          Container(
            height: 240,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage(AssetPaths.imgPlaceholder2),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Used amount',
                  style: AssetStyles.pSm.copyWith(color: Colors.white),
                ),
                Text.rich(
                  style: AssetStyles.h2.copyWith(color: Colors.white),
                  TextSpan(
                    text: '\$11.30',
                    children: [
                      TextSpan(
                        text: ' of \$30.00',
                        style: AssetStyles.h2.copyWith(
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(children: [
                  Text(
                    '•••• 0897',
                    style: AssetStyles.pSm.copyWith(color: Colors.white),
                  ),
                  const Spacer(),
                  const PrimaryAssetImage(AssetPaths.logoMastercard, height: 28)
                ]),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ...[
            (
              title: 'Status',
              value: 'Payment due today',
              color: AssetColors.danger
            ),
            (
              title: 'Auto Top-Up',
              value: 'Set up',
              color: AppColors.getColor(ColorKey.primary60)
            ),
          ].map((e) {
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.title, style: AssetStyles.pMd),
                  Text(
                    e.value,
                    style: AssetStyles.labelMd.copyWith(
                      color: e.color,
                      fontWeight: e.value != 'Set up'
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              const PrimaryDivider(),
              if (e.value != 'Set up') ...[const SizedBox(height: 24)],
            ]);
          }),
        ],
      ),
    );
  }
}
