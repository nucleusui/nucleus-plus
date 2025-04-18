import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Checkout2Page extends StatefulWidget {
  const Checkout2Page({super.key});

  @override
  State<Checkout2Page> createState() => _Checkout2PageState();
}

class _Checkout2PageState extends State<Checkout2Page> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Order details'),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          Text(
            'My Cart',
            style: AssetStyles.h3.copyWith(
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UniversalImage(
                AssetPaths.imgPlaceholder2,
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
                    const Text('Product name', style: AssetStyles.h4),
                    const SizedBox(width: 8),
                    Text(
                      '\$120,00',
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
                            if (quantity > 0) {
                              setState(() => quantity--);
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
                          child: Text('$quantity', style: AssetStyles.labelMd),
                        ),
                        PrimaryInkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () => setState(() => quantity++),
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
              UniversalImage(
                AssetPaths.icDelete2,
                width: 16,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...[
            (
              menu: 'Address',
              icon: AssetPaths.icMapPin,
              title: 'Label',
              subtitle: 'Caption',
            ),
            (
              menu: 'Payment method',
              icon: AssetPaths.icCard2,
              title: 'Credit card',
              subtitle: '****-****-1234',
            ),
          ].asMap().entries.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.value.menu, style: AssetStyles.h3),
                const SizedBox(height: 8),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: UniversalImage(
                      e.value.icon,
                      width: e.key == 1 ? 16 : 20,
                      height: e.key == 1 ? 16 : 20,
                      color: AppColors.getColor(ColorKey.grey80),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.value.title, style: AssetStyles.pMd),
                        const SizedBox(height: 4),
                        Text(
                          e.value.subtitle,
                          style: AssetStyles.pSm.copyWith(
                            color: AppColors.getColor(ColorKey.grey80),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  UniversalImage(
                    AssetPaths.icArrowNext,
                    color: AppColors.getColor(ColorKey.grey60),
                  ),
                  const SizedBox(width: 16),
                ]),
                const SizedBox(height: 24),
              ],
            );
          }),
          const SizedBox(height: 8),
          Text(
            'Order info',
            style: AssetStyles.h4.copyWith(
              color: AppColors.getColor(ColorKey.grey100),
            ),
          ),
          const SizedBox(height: 10),
          ...[
            (title: 'Subtotal', value: 120),
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Checkout',
          buttonSize: ButtonSize.full,
          onTap: () {},
        ),
      ),
    );
  }
}
