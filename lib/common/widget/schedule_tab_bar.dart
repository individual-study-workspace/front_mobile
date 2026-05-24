import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

class ScheduleTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const ScheduleTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _tabItem(
          index: 0,
          icon: SvgPicture.asset(
            'assets/icons/class_outline.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              selectedIndex == 0
                  ? Palette.primaryVariant
                  : Palette.textTertiary,
              BlendMode.srcIn,
            ),
          ),
          text: '수업',
          count: 1,
        ),
        const SizedBox(width: 12),
        _tabItem(
          index: 1,
          icon: SvgPicture.asset(
            'assets/icons/book_outline.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              selectedIndex == 1
                  ? Palette.primaryVariant
                  : Palette.textTertiary,
              BlendMode.srcIn,
            ),
          ),
          text: '과제/제출',
          count: 1,
        ),
        const SizedBox(width: 12),
        _tabItem(
          index: 2,
          icon: SvgPicture.asset(
            'assets/icons/pin_outline.svg',
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2
                  ? Palette.primaryVariant
                  : Palette.textTertiary,
              BlendMode.srcIn,
            ),
          ),
          text: '할 일',
          count: 1,
        ),
      ],
    );
  }

  Widget _tabItem({
    required int index,
    required Widget icon,
    required String text,
    required int count,
  }) {
    final isSelected = selectedIndex == index;

    Color color = isSelected ? Palette.primaryVariant : Palette.textTertiary;
    Color borderColor = isSelected ? Palette.primary : Palette.borderDefault;
    Color bgColor = isSelected ? Palette.primarySoft : Palette.bgSurface;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 4),
            Text(text, style: TextTypes.title4(color: color)),
            const SizedBox(width: 4),
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
                style: TextTypes.caption2(color: Palette.bgSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
