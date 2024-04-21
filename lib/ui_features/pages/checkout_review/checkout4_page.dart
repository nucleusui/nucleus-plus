import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';

class Checkout4Page extends StatefulWidget {
  const Checkout4Page({super.key});

  @override
  State<Checkout4Page> createState() => _Checkout4PageState();
}

class _Checkout4PageState extends State<Checkout4Page> {
  List<int> quantity = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          const Text('Checkout', style: AssetStyles.h1),
          Text(
            '3 items',
            style: AssetStyles.pMd.copyWith(
              color: AppColors.getColor(ColorKey.grey50),
            ),
          ),
          const SizedBox(height: 32),
          ...[
            (
              image: AssetPaths.imgPlaceholder2,
              title: 'Product name',
              price: '\$120,00',
            ),
            (
              image: AssetPaths.imgPlaceholder2,
              title: 'Product name',
              price: '\$120,00',
            ),
          ].asMap().entries.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                PrimaryAssetImage(
                  e.value.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(16),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.value.title, style: AssetStyles.h4),
                      const SizedBox(width: 8),
                      Text(
                        e.value.price,
                        style: AssetStyles.pSm.copyWith(
                          color: AppColors.getColor(ColorKey.grey60),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 32,
                        width: 110,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.getColor(ColorKey.grey30),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          PrimaryInkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              if (quantity[e.key] > 0) {
                                setState(() => quantity[e.key]--);
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: AppColors.getColor(ColorKey.primary60),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '${quantity[e.key]}',
                              style: AssetStyles.labelMd,
                            ),
                          ),
                          PrimaryInkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () => setState(() => quantity[e.key]++),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: AppColors.getColor(ColorKey.primary60),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                PrimaryAssetImage(
                  AssetPaths.icDelete2,
                  width: 16,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.getColor(ColorKey.grey50),
                ),
              ]),
            );
          }),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 24),
            child: PrimaryDivider(),
          ),
          const Text('Payment Method', style: AssetStyles.h4),
          const SizedBox(height: 10),
          ...[
            (title: 'Subtotal', value: 120),
            (title: 'Tax', value: 15),
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: PrimaryButton(
          label: 'Continue to Checkout',
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
