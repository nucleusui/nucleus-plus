import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/calendar/primary_calendar.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Calendar2Page extends StatefulWidget {
  const Calendar2Page({super.key});

  @override
  State<Calendar2Page> createState() => _Calendar2PageState();
}

class _Calendar2PageState extends State<Calendar2Page> {
  DateTime now = DateTime.now();
  DateTime focuseDay = DateTime.now();
  DateTime? startRange;
  DateTime? endRange;

  @override
  void initState() {
    startRange = DateTime.now();
    endRange = DateTime.now().add(const Duration(days: 3));
    WidgetsBinding.instance
        .addPostFrameCallback((_) => showBottomSheet(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        child: Button.primary(
          label: 'Show Bottom Sheet',
          buttonSize: ButtonSize.large,
          onPressed: () => showBottomSheet(context),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Column(children: [
          const Text('Edit Details', style: AssetStyles.h3),
          const SizedBox(height: 12),
          Text(
            '${DateFormat("d MMM").format(startRange ?? DateTime.now())} - ${DateFormat("d MMM").format(endRange ?? DateTime.now())}',
            style: AssetStyles.h2.copyWith(
              color: AppColors.getColor(ColorKey.primary60),
            ),
          ),
          const SizedBox(height: 8),
          PrimaryCalendar(
            endRange: endRange,
            startRange: startRange,
            onDaySelected: (_, lastDate) =>
                setInnerState(() => focuseDay = lastDate),
            onRangeSelected: (start, end, focusedDay) => setInnerState(() {
              startRange = start;
              endRange = end;
              focuseDay = focusedDay;
            }),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: AppColors.getColor(ColorKey.grey30),
                ),
              ),
            ),
            child: Row(children: [
              Expanded(
                child: Button.ghost(
                  label: 'Cancel',
                  buttonSize: ButtonSize.full,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Button.primary(
                  label: 'Apply',
                  buttonSize: ButtonSize.full,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ]),
          ),
        ]);
      }),
    );
  }
}
