import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

import '../provider/home_provider.dart';
import '../../../common/widget/schedule_calendar.dart';
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
                    ScheduleCalendar(
                      currentMonth: homeState.currentMonth,
                      selectedDate: homeState.selectedDate,
                      scheduleTypesForDate: homeState.scheduleTypesForDate,
                      onDateSelected: homeNotifier.selectDate,
                      onPreviousMonth: homeNotifier.goToPreviousMonth,
                      onNextMonth: homeNotifier.goToNextMonth,
                    ),
                    const SizedBox(height: 16),
                    // 점선 구분선
                    Row(
                      children: List.generate(
                        40,
                        (index) => Expanded(
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
