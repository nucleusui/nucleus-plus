import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Event2Page extends StatefulWidget {
  const Event2Page({super.key});

  @override
  State<Event2Page> createState() => _Event2PageState();
}

class _Event2PageState extends State<Event2Page> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: Column(children: [
        Container(
          height: screenHeight(context) / 2,
          padding: const EdgeInsets.only(top: 32),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AssetPaths.imgPlaceholder1),
            ),
          ),
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const PrimaryAssetImage(AssetPaths.icArrowBack),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'UX Design Conference 2022',
                style: AssetStyles.h1.copyWith(height: 1.2),
              ),
              const SizedBox(height: 12),
              Text(
                'May 26-28',
                style: AssetStyles.pMd.copyWith(
                  color: AppColors.getColor(ColorKey.grey60),
                ),
              ),
              const SizedBox(height: 20),
              const Text.rich(
                style: AssetStyles.pMd,
                TextSpan(
                  text:
                      'UX Design conf is the first international UX Designer, dedicated to UX designers from the APAC. ',
                  children: [
                    TextSpan(
                      text: 'Read more',
                      style: AssetStyles.h4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'More info ›',
                style: AssetStyles.h4.copyWith(
                  color: AppColors.getColor(ColorKey.primary60),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
