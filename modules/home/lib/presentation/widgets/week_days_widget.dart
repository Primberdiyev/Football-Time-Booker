import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class WeekDaysWidget extends StatefulWidget {
  const WeekDaysWidget({
    super.key,
    required this.controller,
  });
  final ScrollController controller;

  @override
  State<WeekDaysWidget> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<WeekDaysWidget> {
  final double _itemWidth = 80.0;
  final DateTime _now = DateTime.now();
  late ValueNotifier<DateTime> selectedTimeNotifier;

  @override
  void initState() {
    super.initState();
    selectedTimeNotifier = ValueNotifier(_now);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.controller.hasClients) {
        widget.controller.jumpTo((_now.day - 1) * _itemWidth);
      }
    });
  }

  @override
  void dispose() {
    selectedTimeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocale;
    final theme = context.theme;
    final colors = theme.colors;

    final List<String> weekDays = [
      locale.monday,
      locale.tuesday,
      locale.wednesday,
      locale.thursday,
      locale.friday,
      locale.saturday,
      locale.sunday,
    ];

    final List<String> months = [
      locale.january,
      locale.february,
      locale.march,
      locale.april,
      locale.may,
      locale.june,
      locale.july,
      locale.august,
      locale.september,
      locale.october,
      locale.november,
      locale.december,
    ];

    final daysInMonth = DateTime(_now.year, _now.month + 1, 0).day;

    return ValueListenableBuilder<DateTime>(
        valueListenable: selectedTimeNotifier,
        builder: (
          context,
          selectedDate,
          _,
        ) {
          return SizedBox(
            height: 120,
            child: ListView.builder(
              controller: widget.controller,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemExtent: _itemWidth,
              itemCount: daysInMonth,
              itemBuilder: (context, index) {
                final dayNumber = index + 1;
                final currentDate = DateTime(_now.year, _now.month, dayNumber);

                final isToday = _isSameDay(currentDate, _now);
                final isSelected = _isSameDay(currentDate, selectedDate);

                final backgroundColor = isSelected
                    ? colors.buttonColors.bgPrimary
                    : colors.textColors.whiteTextColor;

                final textColor = (isSelected)
                    ? colors.textColors.whiteTextColor
                    : colors.textColors.blackText;

                return GestureDetector(
                  onTap: () {
                    selectedTimeNotifier.value = currentDate;
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: !(isToday && isSelected)
                          ? Border.all(
                              color: isToday
                                  ? colors.textColors.blackText
                                  : colors.buttonColors.borderSecond,
                            )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weekDays[currentDate.weekday - 1],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "$dayNumber",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          months[currentDate.month - 1],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
