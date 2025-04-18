import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/inkwell/primary_inkwel.dart';
import 'package:nucles_app/ui_features/components/input/primary_switch.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Setting2Page extends StatefulWidget {
  const Setting2Page({super.key});

  @override
  State<Setting2Page> createState() => _Setting2PageState();
}

class _Setting2PageState extends State<Setting2Page> {
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
    (
      group: 'Collection',
      menu: [
        (
          icon: AssetPaths.icLove,
          title: 'Favorites',
          onTap: () {},
        ),
        (
          icon: AssetPaths.icDownload,
          title: 'Download',
          onTap: () {},
        ),
      ],
    ),
    (
      group: 'Preference',
      menu: [
        (
          icon: AssetPaths.icMoon,
          title: 'Dark mode',
          onTap: null,
        ),
        (
          icon: AssetPaths.icNotification,
          title: 'Notifications',
          onTap: null,
        ),
        (
          icon: AssetPaths.icUserBold,
          title: 'Account',
          onTap: () {},
        ),
        (
          icon: AssetPaths.icLogout,
          title: 'Log out',
          onTap: () {},
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getColor(ColorKey.grey10),
      body: ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
        const _HeaderWidget(),
        ...listItem.map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  e.group,
                  style: AssetStyles.h4.copyWith(
                    color: AppColors.getColor(ColorKey.grey50),
                  ),
                ),
              ),
              Container(
                color: AppColors.getColor(ColorKey.background),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: e.menu.map((f) {
                    final isLogout = f.title == 'Log out';
                    return PrimaryInkWell(
                      onTap: f.onTap ??
                          () => setState(() => f.title == 'Dark mode'
                              ? isDarkMode = !isDarkMode
                              : allowNotif = !allowNotif),
                      child: SizedBox(
                        height: 64,
                        child: Row(children: [
                          UniversalImage(
                            f.icon,
                            width: 16,
                            height: 16,
                            color: isLogout ? AssetColors.red : null,
                          ),
                          SizedBox(width: isLogout ? 12 : 16),
                          Text(
                            f.title,
                            style: AssetStyles.pMd.copyWith(
                              color: isLogout ? AssetColors.red : null,
                            ),
                          ),
                          const Spacer(),
                          if (f.onTap == null) ...[
                            PrimarySwitch(
                              value: f.title == 'Dark mode'
                                  ? isDarkMode
                                  : allowNotif,
                              onChanged: (_) => setState(() =>
                                  f.title == 'Dark mode'
                                      ? isDarkMode = !isDarkMode
                                      : allowNotif = !allowNotif),
                            ),
                            const SizedBox(width: 16),
                          ] else if (!isLogout)
                            const UniversalImage(AssetPaths.icArrowNext),
                        ]),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                color: AppColors.getColor(ColorKey.background),
                height: 24,
              ),
            ],
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
      width: double.infinity,
      padding: const EdgeInsets.only(top: kToolbarHeight),
      color: AppColors.getColor(ColorKey.primary60),
      child: Column(children: [
        Text(
          'Settings',
          style: AssetStyles.h3.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 40),
        const UniversalImage(
          AssetPaths.imgUser1,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        Text(
          'James Ryan',
          style: AssetStyles.h3.copyWith(color: Colors.white),
        ),
        Text(
          'james@nucleus.com',
          style: AssetStyles.pSm.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        Button.outline(
          label: 'Edit Profile',
          buttonSize: ButtonSize.large,
          labelColor: Colors.white,
          border: BorderSide(color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}
