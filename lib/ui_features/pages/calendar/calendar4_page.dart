import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/models/basic_model.dart';
import 'package:nucles_app/ui_features/components/calendar/primary_calendar.dart';
import 'package:nucles_app/ui_features/components/chip/primary_chip.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucles_app/ui_features/components/sheet/primary_bottom_sheet.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Calendar4Page extends StatefulWidget {
  const Calendar4Page({super.key});

  @override
  State<Calendar4Page> createState() => _Calendar4PageState();
}

class _Calendar4PageState extends State<Calendar4Page> {
  DateTime now = DateTime.now();
  DateTime focuseDay = DateTime.now();
  DateTime? startRange;
  DateTime? endRange;

  final listFilter = [
    BasicModel(name: "Today", value: true),
    BasicModel(name: "Local", value: false),
    BasicModel(name: "Politics", value: false),
    BasicModel(name: "Tech", value: false),
    BasicModel(name: "Science", value: false),
  ];

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
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 12,
              children: listFilter.map((e) {
                return PrimaryChip(
                  height: 32,
                  text: e.name,
                  isActive: e.value,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onTap: () => setInnerState(() => e.value = !e.value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              Text(
                DateFormat("MMMM yyyy").format(startRange ?? DateTime.now()),
                style: AssetStyles.h3,
              ),
              const Spacer(),
              const UniversalImage(AssetPaths.icArrowBack, height: 12),
              const SizedBox(width: 32),
              const UniversalImage(AssetPaths.icArrowNext, height: 12)
            ]),
          ),
          const SizedBox(height: 8),
          PrimaryCalendar(
            headerVisible: false,
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
            child: Button.primary(
              label: 'Apply',
              buttonSize: ButtonSize.full,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ]);
      }),
    );
  }
}
