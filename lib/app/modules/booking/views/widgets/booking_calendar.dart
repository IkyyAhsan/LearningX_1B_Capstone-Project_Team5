import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final ValueNotifier<DateTime?> _selectedDay = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Studio Booking'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      _focusedDay.value = _focusedDay.value.subtract(Duration(days: 7));
                    },
                  ),
                  ValueListenableBuilder<DateTime>(
                    valueListenable: _focusedDay,
                    builder: (context, value, _) {
                      return Text(
                        DateFormat.yMMMM('id').format(value),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      _focusedDay.value = _focusedDay.value.add(Duration(days: 7));
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<DateTime>(
                valueListenable: _focusedDay,
                builder: (context, value, _) {
                  return TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: value,
                    calendarFormat: CalendarFormat.week,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay.value, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      _selectedDay.value = selectedDay;
                      _focusedDay.value = focusedDay;
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay.value = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      markersMaxCount: 1,
                      outsideDaysVisible: false,
                    ),
                    headerVisible: false,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                      weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}