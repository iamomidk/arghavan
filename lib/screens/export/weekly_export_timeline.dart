import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/export.dart';

class WeeklyExportTimeline extends StatelessWidget {
  final Map<String, List<Export>> exports = {
    'شنبه': [
      Export(
        title: 'تدوین فیلم کامل',
        quantity: 1,
        status: Status.doing,
        requester: 'معماری ایران در دوره صفویه',
        date: '',
      ),
      Export(
        title: 'تدوین فیلم کامل',
        quantity: 1,
        status: Status.done,
        requester: 'معماری ایران در دوره صفویه',
        date: '',
      ),
    ],
    'سه‌شنبه': [
      Export(
        title: 'تدوین فیلم کامل',
        quantity: 1,
        status: Status.expired,
        requester: 'معماری ایران در دوره صفویه',
        date: '',
      ),
    ],
  };

  WeeklyExportTimeline({super.key});

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
          if (exports.containsKey(day))
            ...exports[day]!.map(
              (export) => buildCard(export),
            ),
        ],
      ),
    );
  }

  Color buildStatusColor(Status status) {
    switch (status) {
      case Status.doing:
        return const Color(0xffe89300).withOpacity(0.75);
      case Status.done:
        return const Color(0xff049e7c).withOpacity(0.75);
      case Status.expired:
        return const Color(0xff9e0404).withOpacity(0.75);
      default:
        return const Color(0xffe89300).withOpacity(0.75);
    }
  }

  Widget buildCard(Export export) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        export.title,
                        style: const TextStyle(
                          color: Color(0xff0a2c5e),
                          fontSize: 20,
                          fontFamily: 'Sahel',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'تعداد: ${export.quantity}',
                        style: const TextStyle(
                          color: Color(0xff707070),
                          fontSize: 12,
                          fontFamily: 'Sahel',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: buildStatusColor(export.status),
                    border: Border.all(
                      color: const Color(0xff707070),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                export.requester,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 12,
                  fontFamily: 'Sahel',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
