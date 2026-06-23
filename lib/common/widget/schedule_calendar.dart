import 'package:flutter/material.dart';
import 'package:front_mobile/common/model/schedule.dart';
import 'package:front_mobile/common/theme.dart';

class ScheduleCalendar extends StatelessWidget {
  final DateTime currentMonth;
  final DateTime selectedDate;
  final List<ScheduleType> Function(DateTime date) scheduleTypesForDate;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  const ScheduleCalendar({
    super.key,
    required this.currentMonth,
    required this.selectedDate,
    required this.scheduleTypesForDate,
    required this.onDateSelected,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
        _arrowButton(Icons.chevron_left, onPreviousMonth),
        const SizedBox(width: 12),
        Text(
          '${currentMonth.year}년 ${currentMonth.month}월',
          style: TextTypes.title2B(),
        ),
        const SizedBox(width: 12),
        _arrowButton(Icons.chevron_right, onNextMonth),
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

        if (index == 0) color = Palette.red600;
        if (index == 6) color = Palette.blue600;

        return Expanded(
          child: Center(
            child: Text(weeks[index], style: TextTypes.caption1(color: color)),
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

              // null이면 해당 월 범위 밖 (앞뒤 빈 칸)
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
    final schedules = scheduleTypesForDate(date);

    Color textColor = Palette.textPrimary;

    if (date.weekday == DateTime.sunday) {
      textColor = Palette.red500;
    }

    if (date.weekday == DateTime.saturday) {
      textColor = Palette.blue600;
    }

    return GestureDetector(
      onTap: () => onDateSelected(date),
      child: SizedBox(
        height: 46,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Palette.primary : Colors.transparent,
              ),
              child: Text(
                '${date.day}',
                style: isSelected
                    ? TextTypes.title1B(color: Palette.textPrimaryInverse)
                    : TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: -1,
                        color: textColor,
                      ),
              ),
            ),
            SizedBox(height: 6, child: _buildScheduleDots(schedules)),
          ],
        ),
      ),
    );
  }

  // 최대 3개까지만 표시
  Widget _buildScheduleDots(List<ScheduleType> schedules) {
    if (schedules.isEmpty) {
      return const SizedBox(height: 10);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: schedules.take(3).map((type) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 4,
          height: 4,
          decoration: BoxDecoration(shape: BoxShape.circle, color: type.color),
        );
      }).toList(),
    );
  }

  Widget _buildLegend() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Palette.bgBase,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          _legendItem(Palette.violet400, '수업'),
          const SizedBox(width: 12),
          _legendItem(Palette.green400, '과제/제출'),
          const SizedBox(width: 12),
          _legendItem(Palette.yellow400, 'TO DO LIST'),
        ],
      ),
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
        Text(text, style: TextTypes.caption1(color: Color(0xFF757575))),
      ],
    );
  }

  List<DateTime?> _makeCalendarDays() {
    final firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDay = DateTime(currentMonth.year, currentMonth.month + 1, 0);

    // DateTime.weekday는 월=1 기준이라 일요일 시작으로 보정
    final startBlank = firstDay.weekday % 7;
    final days = <DateTime?>[];

    for (int i = 0; i < startBlank; i++) {
      days.add(null);
    }

    for (int day = 1; day <= lastDay.day; day++) {
      days.add(DateTime(currentMonth.year, currentMonth.month, day));
    }

    // 6주 고정 레이아웃을 위해 42칸 채우기
    while (days.length < 42) {
      days.add(null);
    }

    return days;
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
