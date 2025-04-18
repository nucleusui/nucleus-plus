import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Walktrough2Page extends StatefulWidget {
  const Walktrough2Page({super.key});

  @override
  State<Walktrough2Page> createState() => _Walktrough2PageState();
}

class _Walktrough2PageState extends State<Walktrough2Page> {
  int currentIndex = 0;
  final listItems = [
    (
      image: AssetPaths.imgPaint,
      title: 'Create the best design\nsystem ever',
    ),
    (
      image: AssetPaths.imgToggle,
      title: 'Create the best design\nsystem ever',
    ),
    (
      image: AssetPaths.imgFire,
      title: 'Create the best design\nsystem ever',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: screenHeight(context) / 1.35,
          child: PageView.builder(
            itemCount: listItems.length,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) => Column(children: [
              const Spacer(),
              UniversalImage(
                listItems[index].image,
                width: index == 0 ? 327 : 250,
                height: index == 0 ? 327 : 250,
              ),
              const Spacer(),
              Text(
                listItems[index].title,
                textAlign: TextAlign.center,
                style: AssetStyles.h2.copyWith(height: 1.2),
              ),
            ]),
          ),
        ),
        const SizedBox(height: 16),
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
        const SizedBox(height: 24),
        Button.primary(
          label: 'Sign up',
          buttonSize: ButtonSize.large,
          padding: const EdgeInsets.symmetric(horizontal: 56),
          onTap: () {},
        ),
        const Spacer(),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Have an account? ',
            style: AssetStyles.pMd.copyWith(height: 1.4),
            children: [
              TextSpan(
                text: 'Log in',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.primary70),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
