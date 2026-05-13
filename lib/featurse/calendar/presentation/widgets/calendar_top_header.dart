import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTopHeader extends StatefulWidget {
  const CalendarTopHeader({super.key, this.initialDate, this.onDaySelected, this.onPageChanged});
  /// Initial focused/selected date. Defaults to today.
  final DateTime? initialDate;


  /// Called when the user taps a day.
  final ValueChanged<DateTime>? onDaySelected;

  /// Called when the month page changes.
  final ValueChanged<DateTime>? onPageChanged;
  @override
  State<CalendarTopHeader> createState() => _CalendarTopHeaderState();
}

class _CalendarTopHeaderState extends State<CalendarTopHeader> {

  static const _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];
  String _monthName(int month) => _months[month - 1];
  // ── ✏️ Starting day of week ───────────────────────────────────────────────
  static const _startingDayOfWeek = StartingDayOfWeek.saturday;

  // ── ✏️ Default calendar format ────────────────────────────────────────────
   CalendarFormat _calendarFormat = CalendarFormat.month;

  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay  =  DateTime.now();
    _selectedDay =  DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildViewToggle(),   // Day / Week / Month pill
        _buildCalendar(),     // TableCalendar from pub.dev
      ],
    );
  }

  Widget _buildViewToggle() {
    final modes = {
      'Day':   CalendarFormat.week,       // map label → CalendarFormat
      'Week':  CalendarFormat.twoWeeks,
      'Month': CalendarFormat.month,
    };

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: modes.entries.map((entry) {
          final selected = _calendarFormat == entry.value;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _calendarFormat = entry.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Text(
                  entry.key,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selected ? Colors.white : AppColors.textColor,
                    fontSize: 14,
                    fontWeight:
                    selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      rowHeight: 35,
      daysOfWeekHeight: 25,
      // ── Required ──────────────────────────────────────────────────────────
      firstDay:   DateTime.utc(2020, 1, 1),
      lastDay:    DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,

      // ── ✏️ Format ──────────────────────────────────────────────────────────
      calendarFormat: _calendarFormat,
      startingDayOfWeek:   _startingDayOfWeek,
      availableCalendarFormats: const {
        CalendarFormat.month:    'Month',
        CalendarFormat.twoWeeks: 'Week',
        CalendarFormat.week:     'Day',
      },

      // ── Selection ─────────────────────────────────────────────────────────
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay  = focusedDay;
        });
        widget.onDaySelected?.call(selectedDay);
      },
      onFormatChanged: (format) => setState(() => _calendarFormat = format),
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
        widget.onPageChanged?.call(focusedDay);
      },

      // ── ✏️ Header style ────────────────────────────────────────────────────
      headerStyle: HeaderStyle(
        titleCentered: false,
        formatButtonVisible: false,       // we use our own toggle above
        leftChevronIcon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.fillColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.chevron_left,
              color: AppColors.textColor, size: 18),
        ),
        rightChevronIcon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.fillColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.chevron_right,
              color: AppColors.textColor, size: 18),
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        headerPadding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        decoration: const BoxDecoration(color: Colors.white),
        // ✏️ Prefix icon before the month title
        headerMargin: EdgeInsets.zero,
        titleTextFormatter: (date, locale) =>
        '${_monthName(date.month)} ${date.year}',
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
        leftChevronPadding: const EdgeInsets.only(right: 4),
      ),

      // ── ✏️ Day-of-week (dow) row style ─────────────────────────────────────
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: AppColors.grey1Color,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        weekendStyle: TextStyle(
          color: AppColors.grey1Color,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),

      // ── ✏️ Calendar cell style ─────────────────────────────────────────────
      calendarStyle: CalendarStyle(
        // Selected day
        selectedDecoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        selectedTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),

        // Today (unselected)
        todayDecoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.18),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        todayTextStyle: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
         cellPadding: EdgeInsets.zero,
        // Default day
        defaultTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        weekendTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        // ✅ Weekend
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,           // ← مهم
          borderRadius: BorderRadius.circular(10),
        ),

        // ✅ Outside days
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,           // ← مهم
          borderRadius: BorderRadius.circular(10),
        ),

        // ✅ Disabled
        disabledDecoration: BoxDecoration(
          shape: BoxShape.rectangle,           // ← مهم
          borderRadius: BorderRadius.circular(10),
        ),
        // Out-of-month days
        outsideDaysVisible: true,
        outsideTextStyle: TextStyle(
          color: AppColors.grey1Color.withOpacity(0.5),
          fontSize: 15,
        ),

        cellMargin: const EdgeInsets.all(4),
        isTodayHighlighted: true,
      ),

      // ── ✏️ Custom builders — override individual cells ─────────────────────
      calendarBuilders: CalendarBuilders(
        // Colored dot per day
        // ✏️ Header icon — calendar icon before the month title
        headerTitleBuilder: (context, focusedDay) {
          return Row(
            children: [
              const Icon(Icons.calendar_today_rounded,
                  color: AppColors.textColor, size: 20),
              const SizedBox(width: 8),
              Text(
                '${_monthName(focusedDay.month)} ${focusedDay.year}',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

