import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Product4Page extends StatefulWidget {
  const Product4Page({super.key});

  @override
  State<Product4Page> createState() => _Product4PageState();
}

class _Product4PageState extends State<Product4Page> {
  int slideIndex = 0;
  int currentIndex = 1;
  final List<NavbarModel> navbars = [
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Nucleus UI', actions: [
        PrimaryInkWell(
          onTap: () {},
          child: UniversalImage(
            AssetPaths.icBag,
            width: 20,
            color: AppColors.getColor(ColorKey.primary60),
          ),
        ),
        const SizedBox(width: 5),
      ]),
      body: ListView(shrinkWrap: true, children: [
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(children: [
              const Text('Design System', style: AssetStyles.h1),
              const Spacer(),
              UniversalImage(
                AssetPaths.icLove,
                color: AppColors.getColor(ColorKey.grey50),
              ),
            ]),
            Text(
              'Nucleus UI',
              style: AssetStyles.pSm.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
            const SizedBox(height: 8),
            const Text('\$23', style: AssetStyles.h3),
            const SizedBox(height: 16),
            const PrimaryDivider(),
            const SizedBox(height: 16),
            Text(
              'UI component library and UI kit that provides you the building blocks you need to design your next mobile app.',
              style: AssetStyles.pSm.copyWith(
                color: AppColors.getColor(ColorKey.grey60),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        SizedBox(
          height: screenWidth(context) - 80,
          child: PageView.builder(
            itemCount: 5,
            padEnds: false,
            controller: PageController(viewportFraction: 0.85),
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) => setState(() => slideIndex = value),
            itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.only(left: 16, right: index != 4 ? 0 : 16),
              child: UniversalImage(
                index.isOdd
                    ? AssetPaths.imgPlaceholder1
                    : AssetPaths.imgPlaceholder2,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 5,
            alignment: WrapAlignment.start,
            children: List.generate(5, (index) {
              return Icon(
                Icons.circle,
                size: 8,
                color: index == slideIndex
                    ? AppColors.getColor(ColorKey.primary60)
                    : AppColors.getColor(ColorKey.grey20),
              );
            }).toList(),
          ),
        ),
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
