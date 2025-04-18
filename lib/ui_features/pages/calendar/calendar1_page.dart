import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/calendar/header_calendar.dart';
import 'package:nucles_app/ui_features/components/calendar/primary_calendar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Calendar1Page extends StatefulWidget {
  const Calendar1Page({super.key});

  @override
  State<Calendar1Page> createState() => _Calendar1PageState();
}

class _Calendar1PageState extends State<Calendar1Page> {
  DateTime now = DateTime.now();
  DateTime focuseDay = DateTime.now();
  DateTime? startRange;
  DateTime? endRange;

  @override
  void initState() {
    startRange = DateTime.now();
    endRange = DateTime.now().add(const Duration(days: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Trip dates",
        leading: InkWell(
          child: const Icon(Icons.clear),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          InkWell(
            child: Text(
              "Reset",
              style: AssetStyles.labelMd.copyWith(
                color: AppColors.getColor(ColorKey.primary60),
              ),
            ),
            onTap: () {
              startRange = endRange = null;
              focuseDay = now;
              setState(() {});
            },
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 16),
        HeaderCalendar(startRange: startRange, endRange: endRange),
        const SizedBox(height: 16),
        const PrimaryDivider(),
        PrimaryCalendar(
          endRange: endRange,
          startRange: startRange,
          onDaySelected: (_, lastDate) => setState(() => focuseDay = lastDate),
          onRangeSelected: (start, end, focusedDay) => setState(() {
            startRange = start;
            endRange = end;
            focuseDay = focusedDay;
          }),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Button.primary(
            label: 'Save',
            buttonSize: ButtonSize.full,
            onTap: () => backScreen(),
          ),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
