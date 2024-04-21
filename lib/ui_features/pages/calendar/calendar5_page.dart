import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/navbar_model.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/calendar/primary_calendar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/navbar/primary_navbar.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar5Page extends StatefulWidget {
  const Calendar5Page({super.key});

  @override
  State<Calendar5Page> createState() => _Calendar5PageState();
}

class _Calendar5PageState extends State<Calendar5Page> {
  DateTime now = DateTime.now();
  DateTime focuseDay = DateTime.now();
  DateTime? startRange;
  DateTime? endRange;
  int currentIndex = 2;

  final List<NavbarModel> navbars = [
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
    NavbarModel(),
  ];

  @override
  void initState() {
    startRange = DateTime.now();
    endRange = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Upcoming",
        actions: [
          InkWell(
            onTap: () {},
            child: Text(
              "Filter",
              style: AssetStyles.labelMd.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 8),
        PrimaryCalendar(
          headerVisible: false,
          calendarFormat: CalendarFormat.week,
          endRange: endRange,
          startRange: startRange,
          onDaySelected: (_, date) => setState(() => startRange = date),
        ),
        const SizedBox(height: 16),
        const PrimaryDivider(),
        const SizedBox(height: 16),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const Text('Today', style: AssetStyles.h2),
            Text(
              'Happening near you',
              style: AssetStyles.h5.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
            const SizedBox(height: 8),
            ...[
              (
                group: 'CREATIVITY FOR BUSINESS',
                title: 'Art Skills: Sketching Ideas in Notes',
                time: '2:30 PM - 3:00 PM',
                location: 'Apple Marina Bay Sands',
              ),
              (
                group: 'DESIGN SYSTEM',
                title: 'Build a design system with an enterprise scale',
                time: '2:30 PM - 3:00 PM',
                location: 'Apple Marina Bay Sands',
              ),
              (
                group: 'CREATIVITY',
                title: 'The case for an open design system',
                time: '2:30 PM - 3:00 PM',
                location: 'Apple Marina Bay Sands',
              ),
            ].map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    e.group,
                    style: AssetStyles.h6.copyWith(
                      color: AppColors.getColor(ColorKey.grey50),
                    ),
                  ),
                  Text(e.title, style: AssetStyles.h4),
                  const SizedBox(height: 3),
                  Text(
                    e.time,
                    style: AssetStyles.pXs.copyWith(
                      color: AppColors.getColor(ColorKey.grey50),
                    ),
                  ),
                  Text(
                    e.location,
                    style: AssetStyles.pXs.copyWith(
                      color: AppColors.getColor(ColorKey.grey50),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const PrimaryDivider(),
                ],
              );
            }),
          ],
        )
      ]),
      bottomNavigationBar: PrimaryNavbar(
        index: currentIndex,
        data: navbars,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
