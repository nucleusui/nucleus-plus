import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';

class Walktrough1Page extends StatefulWidget {
  const Walktrough1Page({super.key});

  @override
  State<Walktrough1Page> createState() => _Walktrough1PageState();
}

class _Walktrough1PageState extends State<Walktrough1Page> {
  int currentIndex = 0;
  final listItems = [
    (
      image: AssetPaths.imgMinecraft,
      title: 'Do more with Nucleus',
      subtitle:
          'Full access to 1000+ UI components, Style library, icons and illustration.',
    ),
    (
      image: AssetPaths.imgToggle,
      title: 'Sint incididunt magna culpa voluptate deserunt sunt',
      subtitle:
          'Nulla nisi exercitation nisi amet in in amet minim est consequat.',
    ),
    (
      image: AssetPaths.imgPaint,
      title: 'Velit Lorem ad Lorem occaecat est ullamco ullamco',
      subtitle: 'Commodo culpa magna tempor consequat est nostrud enim minim.',
    ),
    (
      image: AssetPaths.imgFire,
      title: 'Est ut eu sunt id est culpa eiusmod nulla aliqua et',
      subtitle: 'Culpa excepteur tempor do sit commodo duis velit non elit id.',
    ),
    (
      image: AssetPaths.imgMinecraft,
      title: 'Anim ad sunt culpa culpa aliquip pariatur ipsum',
      subtitle: 'Qui mollit anim non amet nostrud et ea magna nostrud commodo.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey10),
      body: Column(children: [
        Expanded(
          child: PageView.builder(
            itemCount: listItems.length,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) => Column(children: [
              const Spacer(),
              PrimaryAssetImage(
                listItems[index].image,
                width: 250,
                height: 250,
              ),
              const Spacer(),
            ]),
          ),
        ),
        Container(
          color: AppColors.getColor(ColorKey.background),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                listItems[currentIndex].title,
                textAlign: TextAlign.center,
                style: AssetStyles.h2.copyWith(height: 1.2),
              ),
              const SizedBox(height: 12),
              Text(
                listItems[currentIndex].subtitle,
                textAlign: TextAlign.center,
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
              const SizedBox(height: 92),
              Wrap(
                spacing: 5,
                alignment: WrapAlignment.center,
                children: listItems.asMap().entries.map((e) {
                  return Icon(
                    Icons.circle,
                    size: 8,
                    color: currentIndex == e.key
                        ? AppColors.getColor(ColorKey.primary60)
                        : AppColors.getColor(ColorKey.grey20),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              Row(children: [
                PrimaryButton(
                  label: 'Log in',
                  width: (screenWidth(context) / 2) - 32,
                  labelStyle: AssetStyles.labelMd.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                  color: AppColors.getColor(ColorKey.primary20),
                  onTap: () {},
                ),
                const SizedBox(width: 16),
                PrimaryButton(
                  label: 'Sign up',
                  width: (screenWidth(context) / 2) - 32,
                  onTap: () {},
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
