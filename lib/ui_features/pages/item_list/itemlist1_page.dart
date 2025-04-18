import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class ItemList1Page extends StatefulWidget {
  const ItemList1Page({super.key});

  @override
  State<ItemList1Page> createState() => _ItemList1PageState();
}

class _ItemList1PageState extends State<ItemList1Page> {
  int currentIndex = 1;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PrimaryAppBar(title: 'Collections'),
        body: Column(children: [
          TabBar(
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.symmetric(vertical: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.getColor(ColorKey.primary60),
            unselectedLabelColor: AppColors.getColor(ColorKey.grey50),
            labelStyle: AssetStyles.h4.copyWith(fontFamily: 'PlusJakartaSans'),
            tabs: ['Design System', 'Component'].asMap().entries.map((e) {
              return Text(e.value);
            }).toList(),
          ),
          Expanded(
            child: TabBarView(children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 24,
                  children: [
                    (
                      image: AssetPaths.imgPlaceholder2,
                      title: 'Nucleus UI',
                      price: 109,
                    ),
                    (
                      image: AssetPaths.imgPlaceholder1,
                      title: 'Foundesign',
                      price: 129,
                    ),
                    (
                      image: AssetPaths.imgPlaceholder7,
                      title: 'The Way Design',
                      price: 99,
                    ),
                    (
                      image: AssetPaths.imgPlaceholder8,
                      title: 'Dominion UI',
                      price: 109,
                    ),
                  ].map((e) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UniversalImage(
                          e.image,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(16),
                          width: (screenWidth(context) / 2) - 22,
                          height: 217,
                        ),
                        const SizedBox(height: 12),
                        Text(e.title, style: AssetStyles.h3),
                        const SizedBox(height: 4),
                        Text(
                          '\$${e.price}',
                          style: AssetStyles.pSm.copyWith(
                            color: AppColors.getColor(ColorKey.grey60),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const Center(
                  child: Text('Component Tab', style: AssetStyles.pMd)),
            ]),
          ),
        ]),
        bottomNavigationBar: PrimaryNavbar(
          index: currentIndex,
          data: navbars,
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}
