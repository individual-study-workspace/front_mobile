import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

import '../../../common/model/schedule.dart';
import '../../../common/widget/common_calendar.dart';
import '../provider/home_provider.dart';
import 'widget/schedule_tab_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.bgSurface,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('logo'),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/notification_outline.svg',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 24),
                SvgPicture.asset(
                  'assets/icons/profile_outline.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ],
        ),
      ),
      body: homeState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CommonCalendar(
                currentDate: homeState.currentMonth,
                selectedDate: homeState.selectedDate,
                onDateSelected: homeNotifier.selectDate,
                onPreviousMonth: homeNotifier.goToPreviousMonth,
                onNextMonth: homeNotifier.goToNextMonth,
                dateIndicatorBuilder: (date) {
                  final schedules = homeState.scheduleTypesForDate(date);

                  if (schedules.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: schedules.take(3).map((type) {
                      return Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: type.color,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              _buildLegend(),
              const SizedBox(height: 16),
              // 점선 구분선
              Row(
                children: List.generate(
                  40,
                      (index) =>
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0.1),
                          height: 1,
                          color: index.isEven
                              ? Palette.borderDefault
                              : Colors.transparent,
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Row(children: [Text('오늘의 수업', style: TextTypes.title2B())]),
              const SizedBox(height: 12),
              ScheduleTabBar(
                selectedIndex: homeState.selectedTabIndex,
                onTap: homeNotifier.selectTab,
                classCount: homeState.classCount,
                assignmentCount: homeState.assignmentCount,
                todoCount: homeState.todoCount,
                schedules: homeState.selectedTabSchedules,
              ),
            ],
          ),
        ),
      ),
    );
  }
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
