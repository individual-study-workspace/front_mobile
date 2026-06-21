import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/theme.dart';

///view : 홈 view, select: 선택
enum CommonCalendarType { view, select }

class CommonCalendar extends StatelessWidget {
  final DateTime currentDate;
  final DateTime selectedDate;
  final Widget Function(DateTime date)? dateIndicatorBuilder;
  final ValueChanged<DateTime> onDateSelected;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback? onTodayTap;
  final CommonCalendarType calendarType;

  const CommonCalendar({
    super.key,
    required this.currentDate,
    required this.selectedDate,
    this.dateIndicatorBuilder,
    required this.onDateSelected,
    required this.onPreviousMonth,
    required this.onNextMonth,
    this.onTodayTap,
    this.calendarType = CommonCalendarType.view,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          calendarType == CommonCalendarType.view
              ? _buildViewHeader()
              : _buildSelectHeader(),
          const SizedBox(height: 24),
          _buildWeekHeader(),
          const SizedBox(height: 12),
          _buildCalendarBody(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildViewHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _arrowButton('assets/icons/left_outline.svg', onPreviousMonth),
        const SizedBox(width: 12),
        Text(
          '${currentDate.year}년 ${currentDate.month}월',
          style: TextTypes.title2B(),
        ),
        const SizedBox(width: 12),
        _arrowButton('assets/icons/right_outline.svg', onNextMonth),
      ],
    );
  }

  Widget _buildSelectHeader() {
    final now = DateTime.now();

    final canMovePrevious =
        currentDate.year > now.year ||
        (currentDate.year == now.year && currentDate.month > now.month);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${currentDate.year}년 ${currentDate.month}월',
          style: TextTypes.title2B(),
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          width: 40,
          child: _arrowButton(
            'assets/icons/left_outline.svg',
            onPreviousMonth,
            enabled: canMovePrevious,
          ),
        ),
        _todayButton(),
        SizedBox(
          height: 40,
          width: 40,
          child: _arrowButton('assets/icons/right_outline.svg', onNextMonth),
        ),
      ],
    );
  }

  Widget _arrowButton(
    String icon,
    VoidCallback onTap, {
    Color? color,
    bool enabled = true,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              enabled ? (color ?? Palette.textPrimary) : Palette.textDisabled,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekHeader() {
    const weeks = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Row(
      children: List.generate(7, (index) {
        Color color = const Color(0xFFC5C9D0);

        if (index == 0) {
          color = Palette.red600;
        } else if (index == 6) {
          color = Palette.blue600;
        }

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
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    final targetDate = DateTime(date.year, date.month, date.day);

    final isPastDate =
        calendarType == CommonCalendarType.select &&
        targetDate.isBefore(todayOnly);

    final isSelected = !isPastDate && _isSameDate(date, selectedDate);

    Color textColor = Palette.textPrimary;

    if (isPastDate) {
      textColor = Palette.textDisabled;
    } else if (date.weekday == DateTime.sunday) {
      textColor = Palette.red500;
    } else if (date.weekday == DateTime.saturday) {
      textColor = Palette.blue600;
    }

    return GestureDetector(
      onTap: isPastDate ? null : () => onDateSelected(date),
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
            SizedBox(
              height: 6,
              child:
                  dateIndicatorBuilder?.call(date) ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  List<DateTime?> _makeCalendarDays() {
    final firstDay = DateTime(currentDate.year, currentDate.month, 1);
    final lastDay = DateTime(currentDate.year, currentDate.month + 1, 0);

    // DateTime.weekday는 월=1 기준이라 일요일 시작으로 보정
    final startBlank = firstDay.weekday % 7;
    final days = <DateTime?>[];

    for (int i = 0; i < startBlank; i++) {
      days.add(null);
    }

    for (int day = 1; day <= lastDay.day; day++) {
      days.add(DateTime(currentDate.year, currentDate.month, day));
    }

    while (days.length < 42) {
      days.add(null);
    }

    return days;
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Widget _todayButton() {
    return GestureDetector(
      onTap: onTodayTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Palette.borderLight),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            '오늘',
            style: TextTypes.title4M(color: Palette.textSecondary),
          ),
        ),
      ),
    );
  }
}
