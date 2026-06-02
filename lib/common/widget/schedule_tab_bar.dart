import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

class ScheduleTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  final int classCount;
  final int assignmentCount;
  final int todoCount;

  final List<ScheduleItem> items;

  const ScheduleTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.classCount = 0,
    this.assignmentCount = 0,
    this.todoCount = 0,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _tabItem(
              index: 0,
              iconPath: 'assets/icons/class_outline.svg',
              text: '수업',
              count: classCount,
            ),
            const SizedBox(width: 8),
            _tabItem(
              index: 1,
              iconPath: 'assets/icons/book_outline.svg',
              text: '과제/제출',
              count: assignmentCount,
            ),
            const SizedBox(width: 8),
            _tabItem(
              index: 2,
              iconPath: 'assets/icons/pin_outline.svg',
              text: '할 일',
              count: todoCount,
            ),
          ],
        ),

        const SizedBox(height: 12),

        if (items.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Palette.violet50,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/calendar_outline.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        Palette.violet600,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '예정된 일정이 없습니다.',
                  style: TextTypes.title3(color: Palette.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  '강의를 개설하면 수업, 과제, 할 일을\n이 곳에서 확인할 수 있어요.',
                  textAlign: TextAlign.center,
                  style: TextTypes.body2R(color: Palette.textTertiary),
                ),
              ],
            ),
          )
        else
          Column(
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Palette.borderDefault),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 3,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              color: Palette.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.title, style: TextTypes.title3()),
                                const SizedBox(height: 4),
                                Text(
                                  item.deadline,
                                  style: TextTypes.body2R(
                                    color: Palette.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }

  Widget _tabItem({
    required int index,
    required String iconPath,
    required String text,
    required int count,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Palette.primarySoft : Palette.bgSurface,
          border: Border.all(
            color: isSelected ? Palette.primary : Palette.borderDefault,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                isSelected ? Palette.primary : Palette.textTertiary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextTypes.title4(
                color: isSelected ? Palette.primary : Palette.textTertiary,
              ).copyWith(height: 1.0),
            ),
            const SizedBox(width: 4),
            if (count > 0)
              Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.statusDanger,
                ),
                child: Text(
                  '$count',
                  style: TextTypes.caption2(
                    color: Palette.bgSurface,
                  ).copyWith(height: 1.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ScheduleItem {
  final String title;
  final String deadline;

  const ScheduleItem({required this.title, required this.deadline});
}
