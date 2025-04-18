import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Event3Page extends StatefulWidget {
  const Event3Page({super.key});

  @override
  State<Event3Page> createState() => _Event3PageState();
}

class _Event3PageState extends State<Event3Page> {
  int currentIndex = 3;
  final List<NavbarModel> navbars = [
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
    NavbarModel(title: 'Title'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Event'),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: ListView(shrinkWrap: true, children: [
        UniversalImage(
          AssetPaths.imgPlaceholder6,
          fit: BoxFit.cover,
          width: double.infinity,
          height: screenHeight(context) / 4,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(children: [
            Text(
              'Scaling your design system in company',
              textAlign: TextAlign.center,
              style: AssetStyles.h1.copyWith(height: 1.2),
            ),
            const SizedBox(height: 12),
            const Text(
              'Build a design system with an enterprise scale',
              textAlign: TextAlign.center,
              style: AssetStyles.pMd,
            ),
            const SizedBox(height: 24),
            Button.primary(
              label: 'Reserve a Spot',
              buttonSize: ButtonSize.full,
              onPressed: () {},
            ),
            const SizedBox(height: 24),
            ...[
              (
                icon: AssetPaths.icCalendar,
                title: 'Thursday, July 17, 2022',
              ),
              (
                icon: AssetPaths.icClockBold,
                title: '9:00am - 5:00pm',
              ),
              (
                icon: AssetPaths.icStarBold,
                title: 'Have participated on Design Foundational Workshop'
              ),
              (
                icon: AssetPaths.icShield,
                title: 'You have been vaccinated against covid'
              ),
            ].map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: UniversalImage(
                        e.icon,
                        width: 16,
                        color: AppColors.getColor(ColorKey.grey100),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(e.title, style: AssetStyles.pMd),
                    ),
                  ],
                ),
              );
            }),
          ]),
        ),
      ]),
    );
  }
}
