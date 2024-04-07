import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/event.dart';

class WeeklyEventTimeline extends StatelessWidget {
  final Map<String, List<Event>> events = {
    'شنبه': [
      Event(
        start: '۸',
        end: '۱۲',
        location: 'سالن کنفرانس',
        title: 'عنوان برنامه',
        requirements: [
          'تصویربرداری',
          'صدابرداری',
          'عکاسی',
          'کارگردانی زنده',
        ],
        time: '۱۴۰۲/۰۹/۰۵ | ۱۲:۳۵',
        requester: 'خانا',
      ),
      Event(
        start: '۸',
        end: '۱۲',
        location: 'سالن کنفرانس',
        title: 'عنوان برنامه',
        requirements: [
          'تصویربرداری',
          'صدابرداری',
          'عکاسی',
          'کارگردانی زنده',
        ],
        time: '۱۴۰۲/۰۹/۰۵ | ۱۲:۳۵',
        requester: 'خانا',
      ),
    ],
    'سه‌شنبه': [
      Event(
        start: '۸',
        end: '۱۲',
        location: 'سالن کنفرانس',
        title: 'عنوان برنامه',
        requirements: [
          'تصویربرداری',
          'صدابرداری',
          'عکاسی',
          'کارگردانی زنده',
        ],
        time: '۱۴۰۲/۰۹/۰۵ | ۱۲:۳۵',
        requester: 'خانا',
      ),
    ],
  };

  WeeklyEventTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    List<String> days = [
      'شنبه',
      'یک‌شنبه',
      'دو‌شنبه',
      'سه‌شنبه',
      'چهار‌شنبه',
      'پنج‌شنبه',
      'جمعه',
    ];

    List<TableRow> rows = [];

    // Generate a list of PersianDate objects for the current week
    List<DateTime> weekDates = List.generate(
      7,
      (index) => currentDate.add(Duration(days: index)),
    );
    rows.add(
      TableRow(
        children: days.asMap().entries.map(
          (entry) {
            final int index = entry.key;
            final String day = entry.value;

            // Format date with the Persian locale
            final String formattedDate = DateFormat('d MMMM', 'fa_IR')
                .format(weekDates[index].toLocal());

            bool isToday = currentDate.day == weekDates[index].day &&
                currentDate.month == weekDates[index].month &&
                currentDate.year == weekDates[index].year;

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isToday ? const Color(0xff0a2c5e) : null,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formattedDate,
                        style: TextStyle(
                          color:
                              isToday ? Colors.white : const Color(0xff707070),
                          fontSize: 12,
                          fontFamily: 'Sahel',
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        day,
                        style: TextStyle(
                          color:
                              isToday ? Colors.white : const Color(0xff707070),
                          fontSize: 20,
                          fontFamily: 'Sahel',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );

    rows.add(
      TableRow(
        children: days.map((day) => buildDayColumn(day)).toList(),
      ),
    );

    return Table(
      border: TableBorder.symmetric(
        inside: const BorderSide(
          color: Color(0xff707070),
        ),
      ),
      children: rows,
    );
  }

  Widget buildDayColumn(String day) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (events.containsKey(day))
            ...events[day]!.map(
              (event) => buildCard(event),
            ),
        ],
      ),
    );
  }

  Widget buildCard(Event event) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${event.start} - ${event.end}',
                  style: const TextStyle(
                    color: Color(0xff707070),
                    fontFamily: 'Sahel',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  event.location,
                  style: const TextStyle(
                    color: Color(0xff707070),
                    fontSize: 12,
                    fontFamily: 'Sahel',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(height: 1.0, color: Color(0xff707070)),
            Center(
              child: Text(
                event.title,
                style: const TextStyle(
                  color: Color(0xff0a2c5e),
                  fontSize: 20,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: event.requirements.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      event.requirements[index],
                      style: const TextStyle(
                        color: Color(0xff707070),
                        fontSize: 12,
                        fontFamily: 'Sahel',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1.0, color: Color(0xff707070)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    event.time,
                    style: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 10,
                      fontFamily: 'Sahel',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    event.requester,
                    style: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 10,
                      fontFamily: 'Sahel',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
