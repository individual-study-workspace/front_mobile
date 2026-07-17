import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_mobile/common/widget/button/button.dart';
import 'package:front_mobile/common/widget/button/button_style.dart';
import 'package:front_mobile/common/widget/common_badge.dart';

import '../../../../../../../common/theme.dart';
import '../../../../model/assignment_info_response.dart';
import '../../../../model/class_main_state.dart';
import '../../../../model/classroom_type.dart';

class AssignmentItem extends StatelessWidget {
  final UserType userType;
  final AssignmentInfoResponse assignment;
  final VoidCallback? onButtonTap;

  const AssignmentItem({
    super.key,
    required this.userType,
    required this.assignment,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.bgBase,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 회차 + D-Day
          Row(
            children: [
              CommonBadge(
                text: assignment.currentSession,
                textStyle: TextTypes.caption2(color: Palette.blue500),
                backgroundColor: Palette.blue50,
              ),
              const SizedBox(width: 6),
              CommonBadge(
                text: getDueDateText(assignment.dueDate.toString()),
                textStyle: TextTypes.caption2(color: Palette.red500),
                backgroundColor: Palette.red50,
              ),
            ],
          ),
          const SizedBox(height: 4),

          /// 과제명
          Text(
            assignment.title,
            style: TextTypes.title3SB(color: Palette.textPrimary),
          ),

          const SizedBox(height: 8),

          /// 마감일
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/time_outline.svg',
                width: 12,
                height: 12,
                colorFilter: ColorFilter.mode(
                  Palette.iconTertiary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '마감일:${formatDate(assignment.dueDate)} ${formatTime(TimeOfDay.fromDateTime(assignment.dueDate))}',
                style: TextTypes.caption1(color: Palette.textTertiary),
              ),
            ],
          ),

          const SizedBox(height: 4),

          if (userType == UserType.tutor)
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/clipboard_outline.svg',
                  width: 12,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    Palette.iconTertiary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '제출 현황: ${assignment.submittedCount} / ${assignment.totalCount}',
                  style: TextTypes.caption1(color: Palette.textTertiary),
                ),
              ],
            ),

          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: PrimaryButton(
              variant: ButtonVariant.neutral,
              size: ButtonSize.medium,
              content: userType == UserType.tutor ? '채점하기' : '제출하기',
              onPressed: onButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
