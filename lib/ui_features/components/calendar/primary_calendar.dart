import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nucles_app/config/config.dart';
import 'package:table_calendar/table_calendar.dart';

class PrimaryCalendar extends StatelessWidget {
  const PrimaryCalendar({
    super.key,
    this.startRange,
    this.endRange,
    this.onDaySelected,
    this.onRangeSelected,
    this.headerVisible = true,
    this.calendarFormat = CalendarFormat.month,
  });

  final DateTime? startRange;
  final DateTime? endRange;
  final void Function(DateTime, DateTime)? onDaySelected;
  final void Function(DateTime?, DateTime?, DateTime)? onRangeSelected;
  final bool headerVisible;
  final CalendarFormat calendarFormat;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      availableGestures: AvailableGestures.all,
      focusedDay: startRange ?? DateTime.now(),
      calendarFormat: calendarFormat,
      headerVisible: headerVisible,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleCentered: true,
        headerPadding: EdgeInsets.only(top: 24, bottom: 16),
        titleTextStyle: AssetStyles.h5,
      ),
      firstDay: DateTime.now(),
      lastDay: DateTime(2100),
      currentDay: startRange ?? DateTime.now(),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: AssetStyles.h5,
        weekdayStyle: AssetStyles.h5,
        dowTextFormatter: (date, locale) {
          return DateFormat("E").format(date).split("").first;
        },
      ),
      daysOfWeekHeight: 56,
      calendarStyle: CalendarStyle(
        defaultTextStyle: AssetStyles.h5
            .copyWith(color: AppColors.getColor(ColorKey.primary70)),
        rangeStartTextStyle: AssetStyles.h5.copyWith(color: Colors.white),
        rangeEndTextStyle: AssetStyles.h5.copyWith(color: Colors.white),
        selectedTextStyle: AssetStyles.h5.copyWith(color: Colors.white),
        withinRangeTextStyle: AssetStyles.h5
            .copyWith(color: AppColors.getColor(ColorKey.primary70)),
        weekendTextStyle: AssetStyles.h5
            .copyWith(color: AppColors.getColor(ColorKey.primary70)),
        holidayTextStyle: AssetStyles.h5
            .copyWith(color: AppColors.getColor(ColorKey.primary70)),
        disabledTextStyle:
            AssetStyles.h5.copyWith(color: AppColors.getColor(ColorKey.grey50)),
        rangeHighlightColor: AppColors.getColor(ColorKey.primary20),
        todayDecoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.primary60),
          shape: BoxShape.circle,
        ),
        rangeStartDecoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.primary60),
          shape: BoxShape.circle,
        ),
        rangeEndDecoration: BoxDecoration(
          color: AppColors.getColor(ColorKey.primary60),
          shape: BoxShape.circle,
        ),
      ),
      enabledDayPredicate: (date) =>
          date.difference(DateTime.now()).inDays >= 0,
      rangeEndDay: endRange,
      rangeStartDay: startRange,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onDaySelected: onDaySelected,
      onRangeSelected: onRangeSelected,
    );
  }
}
