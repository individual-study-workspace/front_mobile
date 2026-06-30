import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/button.dart';
import '../../../../model/assignment_info_response.dart';
import '../../../../model/class_main_state.dart';

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
              Text(
                '[${assignment.currentSession}]',
                style: TextTypes.caption1(color: Palette.primary),
              ),
              const SizedBox(width: 8),
              Text('D-DAY', style: TextTypes.caption1(color: Palette.red500)),
            ],
          ),

          const SizedBox(height: 8),

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
                width: 16,
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '마감일: ${assignment.dueDate}',
                style: TextTypes.body2R(color: Palette.textSecondary),
              ),
            ],
          ),

          const SizedBox(height: 4),

          if (userType == UserType.tutor)
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/checks_outline.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '제출 현황: ${assignment.submittedCount} / ${assignment.totalCount}',
                  style: TextTypes.body2R(color: Palette.textSecondary),
                ),
              ],
            ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: SecondaryMediumButton(
              content: userType == UserType.tutor ? '채점하기' : '제출하기',
              onPressed: onButtonTap,
            ),
          ),
        ],
      ),
    );
  }
}
