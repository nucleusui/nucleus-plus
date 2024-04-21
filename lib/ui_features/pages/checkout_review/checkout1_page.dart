import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_radio.dart';

class Checkout1Page extends StatefulWidget {
  const Checkout1Page({super.key});

  @override
  State<Checkout1Page> createState() => _Checkout1PageState();
}

class _Checkout1PageState extends State<Checkout1Page> {
  final listItem = [
    BasicModel(name: "Label", value: false),
    BasicModel(name: "Label ", value: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Checkout', actions: [
        PrimaryInkWell(
          onTap: () {},
          child: Text(
            'Edit',
            style: AssetStyles.labelLg.copyWith(
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
        ),
      ]),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping address',
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Office', style: AssetStyles.h5),
                const SizedBox(height: 5),
                Row(children: [
                  const Expanded(
                    child: Text(
                      'Permata Hijau, Bellezza BSA\nJl. Permata Hijau No.106, Kec. Kby. Lama, Daerah Khusus Ibukota Jakarta 12210',
                      style: AssetStyles.pSm,
                    ),
                  ),
                  const SizedBox(width: 16),
                  PrimaryInkWell(
                    onTap: () {},
                    child: PrimaryAssetImage(
                      AssetPaths.icArrowNext,
                      width: 8,
                      color: AppColors.getColor(ColorKey.grey50),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            height: 12,
            color: AppColors.getColor(ColorKey.grey10),
            margin: const EdgeInsets.symmetric(vertical: 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment method',
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                const SizedBox(height: 8),
                ...listItem.asMap().entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: PrimaryRadio(
                      title: e.value.name,
                      selected: e.value.value,
                      divider: e.key == 0,
                      onTap: () {
                        for (final f in listItem) {
                          f.value = false;
                        }
                        setState(() => e.value.value = !e.value.value);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            height: 12,
            color: AppColors.getColor(ColorKey.grey10),
            margin: const EdgeInsets.only(bottom: 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order review',
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.grey100),
                  ),
                ),
                const SizedBox(height: 16),
                ...[
                  (title: 'Item Price', value: 120),
                  (title: 'Shipping cost', value: 15),
                  (title: 'Total', value: 135),
                ].map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(children: [
                      Text(e.title, style: AssetStyles.pMd),
                      const Spacer(),
                      Text('\$${e.value}', style: AssetStyles.h4),
                    ]),
                  );
                }),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    style: AssetStyles.pSm,
                    TextSpan(
                      text: 'you pay approx  ',
                      children: [
                        TextSpan(
                          text: '\$254.72',
                          style: AssetStyles.pSm
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
