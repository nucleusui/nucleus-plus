import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class ItemList3Page extends StatefulWidget {
  const ItemList3Page({super.key});

  @override
  State<ItemList3Page> createState() => _ItemList3PageState();
}

class _ItemList3PageState extends State<ItemList3Page> {
  int currentIndex = 2;
  final List<NavbarModel> navbars = [
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          PrimaryInkWell(
            onTap: () {},
            child: UniversalImage(
              AssetPaths.icLove,
              width: 20,
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
        ],
      ),
      body: ListView(shrinkWrap: true, children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text('Category', style: AssetStyles.h2),
        ),
        ...List.generate(2, (index) {
          return Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 16,
                children: List.generate(5, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UniversalImage(
                        AssetPaths.imgPlaceholder2,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      const SizedBox(height: 12),
                      const Text('Product name', style: AssetStyles.h5),
                      const SizedBox(height: 8),
                      Row(children: [
                        const UniversalImage(
                          AssetPaths.imgUser1,
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('James Ryan', style: AssetStyles.h5),
                            Text(
                              'Product Design',
                              style: AssetStyles.pXs.copyWith(
                                color: AppColors.getColor(ColorKey.grey50),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  );
                }),
              ),
            ),
            if (index != 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: PrimaryDivider(),
              ),
          ]);
        }),
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
