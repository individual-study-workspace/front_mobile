import 'package:flutter/material.dart';
import 'package:front_mobile/common/theme.dart';

class ScheduleCalendar extends StatefulWidget {
  const ScheduleCalendar({super.key});

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  DateTime currentMonth = DateTime.now();
  DateTime selectedDate = DateTime.now();

  final Map<int, List<ScheduleType>> scheduleMap = {
    6: [ScheduleType.classType, ScheduleType.assignment],
    13: [ScheduleType.assignment],
    15: [ScheduleType.more],
    18: [ScheduleType.todo],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildWeekHeader(),
          const SizedBox(height: 12),
          _buildCalendarBody(),
          const SizedBox(height: 19),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _arrowButton(Icons.chevron_left, () {
          setState(() {
            currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
          });
        }),
        const SizedBox(width: 12),
        Text(
          '${currentMonth.year}년 ${currentMonth.month}월',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF202124),
          ),
        ),
        const SizedBox(width: 12),
        _arrowButton(Icons.chevron_right, () {
          setState(() {
            currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
          });
        }),
      ],
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Icon(icon, size: 28, color: const Color(0xFF6948FF)),
    );
  }

  Widget _buildWeekHeader() {
    const weeks = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Row(
      children: List.generate(7, (index) {
        Color color = const Color(0xFFC5C9D0);

        if (index == 0) color = const Color(0xFFFF3B3B);
        if (index == 6) color = const Color(0xFF653DFF);

        return Expanded(
          child: Center(
            child: Text(
              weeks[index],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCalendarBody() {
    final days = _makeCalendarDays();

    return Column(
      children: List.generate(6, (weekIndex) {
        return Padding(
          padding: EdgeInsets.only(bottom: weekIndex == 5 ? 0 : 14),
          child: Row(
            children: List.generate(7, (dayIndex) {
              final index = weekIndex * 7 + dayIndex;
              final date = days[index];

              if (date == null) {
                return const Expanded(child: SizedBox(height: 47));
              }

              return Expanded(child: _buildDateCell(date));
            }),
          ),
        );
      }),
    );
  }

  Widget _buildDateCell(DateTime date) {
    final isSelected = _isSameDate(date, selectedDate);
    final schedules = scheduleMap[date.day] ?? [];

    Color textColor = Palette.textPrimary;

    if (date.weekday == DateTime.sunday) {
      textColor = Palette.red500;
    }

    if (date.weekday == DateTime.saturday) {
      textColor = Palette.primary;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = date;
        });
      },
      child: SizedBox(
        height: 47,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Palette.primary : Colors.transparent,
                ),
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : textColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            _buildScheduleDots(schedules),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleDots(List<ScheduleType> schedules) {
    if (schedules.isEmpty) {
      return const SizedBox(height: 10);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: schedules.take(3).map((type) {
        if (type == ScheduleType.more) {
          return Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.violet400,
            ),
            child: const Text(
              '+3',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 11,
          height: 11,
          decoration: BoxDecoration(shape: BoxShape.circle, color: type.color),
        );
      }).toList(),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _legendItem(Palette.violet400, '수업'),
        const SizedBox(width: 12),
        _legendItem(const Color(0xFF35C995), '과제/제출'), // green 컬러 추가 후 변경 필요
        const SizedBox(width: 12),
        _legendItem(
          const Color(0xFFF5B82E),
          'TO DO LIST',
        ), // yellow 컬러 추가 후 변경 필요
      ],
    );
  }

  Widget _legendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 11,
          height: 11,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF7E828A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  List<DateTime?> _makeCalendarDays() {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);

    final startBlank = firstDay.weekday % 7;
    final days = <DateTime?>[];

    for (int i = 0; i < startBlank; i++) {
      days.add(null);
    }

    for (int day = 1; day <= lastDay.day; day++) {
      days.add(DateTime(currentMonth.year, currentMonth.month, day));
    }

    while (days.length < 42) {
      days.add(null);
    }

    return days;
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

enum ScheduleType { classType, assignment, todo, more }

extension ScheduleTypeColor on ScheduleType {
  Color get color {
    switch (this) {
      case ScheduleType.classType:
        return const Color(0xFF6948FF);
      case ScheduleType.assignment:
        return const Color(0xFF35C995);
      case ScheduleType.todo:
        return const Color(0xFFF5B82E);
      case ScheduleType.more:
        return const Color(0xFF8A63FF);
    }
  }
}
