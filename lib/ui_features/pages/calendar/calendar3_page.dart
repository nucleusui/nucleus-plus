import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/calendar/primary_calendar.dart';
import 'package:nucles_app/ui_features/components/divider/primary_divider.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';

class Calendar3Page extends StatefulWidget {
  const Calendar3Page({super.key});

  @override
  State<Calendar3Page> createState() => _Calendar3PageState();
}

class _Calendar3PageState extends State<Calendar3Page> {
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
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          PrimaryButton(
            label: 'Show Bottom Sheet',
            onTap: () => showBottomSheet(context),
          ),
        ]),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) {
    return primaryBottomSheet(
      context,
      child: StatefulBuilder(builder: (context, setInnerState) {
        return Column(children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cancel',
                  style: AssetStyles.h3.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
                const Text('New Event', style: AssetStyles.h3),
                Text(
                  'Publish',
                  style: AssetStyles.h3.copyWith(
                    color: AppColors.getColor(ColorKey.primary60),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Text(
                DateFormat("MMMM yyyy").format(startRange ?? DateTime.now()),
                style: AssetStyles.h3,
              ),
              const Spacer(),
              const PrimaryAssetImage(AssetPaths.icArrowBack, height: 12),
              const SizedBox(width: 32),
              const PrimaryAssetImage(AssetPaths.icArrowNext, height: 12)
            ]),
          ),
          PrimaryCalendar(
            endRange: endRange,
            startRange: startRange,
            headerVisible: false,
            onDaySelected: (_, lastDate) =>
                setInnerState(() => focuseDay = lastDate),
            onRangeSelected: (start, end, focusedDay) => setInnerState(() {
              startRange = start;
              endRange = end;
              focuseDay = focusedDay;
            }),
          ),
          const SizedBox(height: 16),
          const PrimaryDivider(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Time', style: AssetStyles.pMd),
                  Text(
                    '6:00 PM',
                    style: AssetStyles.h4.copyWith(
                      color: AppColors.getColor(ColorKey.primary60),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const PrimaryTextField(
                minLines: 4,
                height: null,
                maxLines: 10,
                hintText: 'Write a note',
              ),
            ]),
          ),
          const SizedBox(height: 64),
        ]);
      }),
    );
  }
}
