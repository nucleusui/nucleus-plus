import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/input/primary_switch.dart';

class Wallet1Page extends StatefulWidget {
  const Wallet1Page({super.key});

  @override
  State<Wallet1Page> createState() => _Wallet1PageState();
}

class _Wallet1PageState extends State<Wallet1Page> {
  bool isPrimary = true;
  final listItem = [
    BasicModel(name: "Top up", icon: AssetPaths.icPlus, value: false),
    BasicModel(name: "Transfer", icon: AssetPaths.icArrowRight, value: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _HeaderWidget(),
        const SizedBox(height: 24),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 16,
                children: listItem.map((e) {
                  return PrimaryChip(
                    height: 32,
                    text: e.name,
                    isActive: e.value,
                    stackAlignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 40, right: 16),
                    alignment: Alignment.centerRight,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: PrimaryAssetImage(
                        e.icon!,
                        color: e.value
                            ? Colors.white
                            : AppColors.getColor(ColorKey.primary70),
                      ),
                    ),
                    onTap: () => setState(() => e.value = !e.value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            Row(children: [
              const Text(
                'Set as primary payment methods',
                style: AssetStyles.pMd,
              ),
              const Spacer(),
              PrimarySwitch(
                value: isPrimary,
                onChanged: (p0) => setState(() => isPrimary = !isPrimary),
              ),
              const SizedBox(width: 16),
            ]),
            const SizedBox(height: 24),
            const PrimaryDivider(),
            const SizedBox(height: 20),
            Row(children: [
              const Text('Auto Top-Up', style: AssetStyles.pMd),
              const Spacer(),
              Text(
                'Set up Now',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              ),
            ]),
            const SizedBox(height: 16),
          ],
        ),
        Container(
          height: 12,
          margin: const EdgeInsets.symmetric(vertical: 24),
          color: AppColors.getColor(ColorKey.grey10),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const Text('Wallet transactions', style: AssetStyles.h4),
            const SizedBox(height: 32),
            ...[
              (title: 'Top up', value: '+ USD 12.00', isMinus: false),
              (title: 'Payment', value: '- USD 9.00', isMinus: true),
            ].map((e) {
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.title, style: AssetStyles.pMd),
                    Text(
                      e.value,
                      style: AssetStyles.labelMd.copyWith(
                        color:
                            e.isMinus ? AssetColors.danger : AssetColors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                if (!e.isMinus) ...[
                  const PrimaryDivider(),
                  const SizedBox(height: 24)
                ],
              ]);
            }),
          ],
        )
      ]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) / 3.75,
      width: screenWidth(context),
      padding: const EdgeInsets.only(right: 16, bottom: 16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetPaths.imgPlaceholder2),
        ),
      ),
      alignment: Alignment.topLeft,
      child: Column(children: [
        const PrimaryAppBar(iconColor: Colors.white),
        const Spacer(),
        Row(children: [
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Your balance',
              style: AssetStyles.h2.copyWith(color: Colors.white),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('\$', style: AssetStyles.pSm.copyWith(color: Colors.white)),
              const SizedBox(width: 3),
              Text(
                '10.11',
                style: AssetStyles.h2.copyWith(
                  height: 1.2,
                  color: Colors.white,
                ),
              ),
            ]),
          ]),
          const Spacer(),
          const PrimaryAssetImage(
            AssetPaths.imgUser1,
            fit: BoxFit.cover,
            width: 48,
            height: 48,
          )
        ])
      ]),
    );
  }
}
