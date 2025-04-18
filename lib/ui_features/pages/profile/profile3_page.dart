import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';

class Profile3Page extends StatefulWidget {
  const Profile3Page({super.key});

  @override
  State<Profile3Page> createState() => _Profile3PageState();
}

class _Profile3PageState extends State<Profile3Page> {
  bool isDarkMode = false;
  bool allowNotif = true;
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel()
  ];
  final listItem = [
    (title: 'Account', onTap: () {}),
    (title: 'User Profile', onTap: () {}),
    (title: 'Privacy & Safety', onTap: () {}),
    (title: 'Connections', onTap: () {}),
    (title: 'Scan QR Code', onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey10),
      body: ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        const _HeaderWidget(),
        const SizedBox(height: 4),
        ...listItem.map((e) {
          return PrimaryInkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Text(e.title, style: AssetStyles.pMd),
                const Spacer(),
                UniversalImage(
                  AssetPaths.icArrowNext,
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ]),
            ),
          );
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

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetPaths.imgPlaceholder2),
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const UniversalImage(
          AssetPaths.imgUser7,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amanda',
              style: AssetStyles.h2.copyWith(color: Colors.white),
            ),
            Text(
              'amanda@nucleus-ui.com',
              style: AssetStyles.pMd.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
          ],
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}
