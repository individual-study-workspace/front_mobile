
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/theme.dart';

class TodoListCard extends StatelessWidget {
  final int todoCount;
  final VoidCallback? onMoreTap;

  const TodoListCard({super.key, this.todoCount = 0, this.onMoreTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.bgSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '투두리스트',
                      style: TextTypes.title4M(color: Palette.textPrimary),
                    ),
                    const WidgetSpan(child: SizedBox(width: 8)),
                    TextSpan(
                      text: '$todoCount',
                      style: TextTypes.title4M(color: Palette.primaryVariant),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onMoreTap,
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '전체보기',
                      style: TextTypes.caption1(color: Palette.textTertiary),
                    ),
                    const SizedBox(width: 2),
                    SvgPicture.asset(
                      'assets/icons/right_outline.svg',
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          DottedBorder(
            color: Palette.borderDefault,
            strokeWidth: 1,
            dashPattern: const [4, 4],
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.violet50,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/checks_outline.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                        colorFilter: const ColorFilter.mode(
                          Palette.violet600,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '현재 등록된 할 일이 없습니다.',
                    style: TextTypes.body2R(color: Palette.textTertiary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
