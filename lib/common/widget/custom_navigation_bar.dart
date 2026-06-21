import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_mobile/common/theme.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int chatCount;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.chatCount = 0,
  });

  // 네비게이션 텍스트 및 아이콘 경로
  static const List<_NavItem> items = [
    _NavItem(
      label: '홈',
      activeIcon: 'assets/icons/home_filled.svg',
      inactiveIcon: 'assets/icons/home_outline.svg',
    ),
    _NavItem(
      label: '강의실',
      activeIcon: 'assets/icons/class_filled.svg',
      inactiveIcon: 'assets/icons/class_outline.svg',
    ),
    _NavItem(
      label: '채팅',
      activeIcon: 'assets/icons/message_filled.svg',
      inactiveIcon: 'assets/icons/message_outline.svg',
    ),
    _NavItem(
      label: '자료실',
      activeIcon: 'assets/icons/archive_filled.svg',
      inactiveIcon: 'assets/icons/archive_outline.svg',
    ),
    _NavItem(
      label: '마이페이지',
      activeIcon: 'assets/icons/user_filled.svg',
      inactiveIcon: 'assets/icons/user_outline.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Palette.bgSurface,
        border: Border(top: BorderSide(color: Palette.borderLight, width: 1)),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final selected = currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: SizedBox(
                height: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // 아이콘
                        SvgPicture.asset(
                          selected ? item.activeIcon : item.inactiveIcon,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            selected
                                ? Palette.iconPrimary
                                : Palette.iconTertiary,
                            BlendMode.srcIn,
                          ),
                        ),
                        if (index == 2 && chatCount > 0)
                          Positioned(
                            right: -10,
                            top: -5,
                            child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              decoration: const BoxDecoration(
                                color: Palette.statusDanger,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              // 읽지 않은 채팅 수 표시 영역
                              child: Text(
                                chatCount > 99 ? '99+' : '$chatCount',
                                style: TextTypes.caption2(
                                  color: Palette.bgSurface,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    // 하단 텍스트
                    Text(
                      item.label,
                      style: TextTypes.caption2(
                        color: selected
                            ? Palette.textPrimary
                            : Palette.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String activeIcon;
  final String inactiveIcon;

  const _NavItem({
    required this.label,
    required this.activeIcon,
    required this.inactiveIcon,
  });
}
