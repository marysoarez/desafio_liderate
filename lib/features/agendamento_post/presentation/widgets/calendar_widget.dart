
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;
  final List<DateTime> markedDates;

  const CalendarWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.markedDates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final markedSet = markedDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet();

    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: selectedDate,
      selectedDayPredicate: (day) =>
          isSameDay(selectedDate, day),

      onDaySelected: (selectedDay, focusedDay) {
        onDateSelected(selectedDay);
      },

      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        markerDecoration: const BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
      ),

      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          final normalized = DateTime(date.year, date.month, date.day);
          if (markedSet.contains(normalized)) {
            return const Positioned(
              bottom: 1,
              child: Icon(Icons.circle, size: 6, color: Colors.redAccent),
            );
          }
          return null;
        },
      ),
    );
  }
}
