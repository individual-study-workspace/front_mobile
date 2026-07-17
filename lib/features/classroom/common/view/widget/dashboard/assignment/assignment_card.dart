import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../common/theme.dart';
import '../../../../../../../common/widget/button/button.dart';
import '../../../../../../../common/widget/button/button_style.dart';
import '../../../../model/assignment_info_response.dart';
import '../../../../model/class_main_state.dart';
import 'assignment_item.dart';
import 'empty_assignment.dart';

class AssignmentCard extends StatelessWidget {
  final UserType userType;
  final List<AssignmentInfoResponse>? assignments;
  final VoidCallback? onMoreTap;

  const AssignmentCard({
    super.key,
    required this.userType,
    this.assignments,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    final assignmentList = assignments ?? [];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Palette.bgSurface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: userType == UserType.tutor ? '미채점 과제' : '미제출 과제',
                  style: TextTypes.title4M(color: Palette.textPrimary),
                ),
                const WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: '${assignments?.length ?? 0}',
                  style: TextTypes.title4M(color: Palette.primaryVariant),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          if (assignmentList.isNotEmpty)
            Text(
              '마감 임박순으로 최대 2개 표시됩니다.',
              style: TextTypes.caption1(color: Palette.textSecondary),
            ),
          const SizedBox(height: 12),

          if (assignmentList.isEmpty)
            EmptyAssignment(userType: userType)
          else ...[
            Column(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    bottom: index == assignmentList.length - 1 ? 0 : 8,
                  ),
                  child: AssignmentItem(
                    userType: userType,
                    assignment: assignmentList[index], // 하나씩 전달
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TertiaryButton(
                variant: ButtonVariant.neutral,
                contentBuilder: (textColor) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '과제함에서 전체 확인',
                      style: TextTypes.title4M(color: textColor),
                    ),
                    const SizedBox(width: 2),
                    SvgPicture.asset(
                      'assets/icons/right_outline.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
